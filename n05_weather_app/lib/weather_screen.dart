import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:n05_weather_app/additional_info_item.dart';
import 'package:n05_weather_app/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;
import 'package:n05_weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;
  Future<Map<String, dynamic>> getCurrentWeather() async {
    // below code is quite tedious, because in case of something goes wrong, it will throw error + its continuously loading
    try {
      final res = await http.get(
        Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$lon&days=1&aqi=no&alerts=no",
        ),
      );

      if (res.statusCode != 200) {
        throw "an unaccepted error occured, statusCode: ${res.statusCode}";
      }

      final data = jsonDecode(res.body);
      // temp = data['forecast']['forecastday'][0]['day']['avgtemp_c'];
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          // print(
          //   snapshot,
          // ); // AsyncSnapshot<dynamic>(ConnectionState.waiting, null, null, null)
          // print(
          //   "Type: ${snapshot.runtimeType}",
          // ); // Type: AsyncSnapshot<dynamic>
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Text(
              "Api fails to load or something went wrong, error value: ${snapshot.error.toString()}",
            );
          }

          final data = snapshot.data!;
          final currentTemp = data['current']['temp_c'];
          final String currentSky = data['current']['condition']['text'];
          // final String currentSky = "snowing";
          final currentPressure = data['current']['pressure_mb'];
          final currentHumdity = data['current']['humidity'];
          final currentWindy = data['current']['wind_kph'];
          final hourlyData = data['forecast']['forecastday'][0]['hour'];
          // print(hourlyData);
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "$currentTemp° C",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Icon(
                                currentSky == "Partly cloudy" ||
                                        currentSky == "cloudy"
                                    ? Icons.cloud
                                    : currentSky.contains("rain")
                                    ? Icons.cloudy_snowing
                                    : currentSky.contains("snow")
                                    ? Icons.severe_cold
                                    : Icons.sunny,
                                size: 64,
                              ),
                              const SizedBox(height: 16),
                              Text(currentSky, style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // weather card
                const SizedBox(height: 20),
                const Text(
                  "Hourly Forecast",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for (int idx = 0; idx < hourlyData.length; idx++)
                //         HourlyForecastItem(
                //           time: hourlyData[idx]['time']
                //               .split(" ")[1]
                //               .toString(),
                //           icon:
                //               hourlyData[idx]['condition']['text']
                //                   .toString()
                //                   .toLowerCase()
                //                   .contains("cloudy")
                //               ? Icons.cloud
                //               : hourlyData[idx]['condition']['text']
                //                     .toString()
                //                     .toLowerCase()
                //                     .contains("rain")
                //               ? Icons.cloudy_snowing
                //               : hourlyData[idx]['condition']['text']
                //                     .toString()
                //                     .toLowerCase()
                //                     .contains("snow")
                //               ? Icons.severe_cold
                //               : Icons.sunny,
                //           temperature: "${hourlyData[idx]['temp_c']}°C",
                //         ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: 23,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final weatherCondition =
                          hourlyData[index]['condition']['text']
                              .toString()
                              .toLowerCase();
                      return HourlyForecastItem(
                        time: hourlyData[index]['time']
                            .split(" ")[1]
                            .toString(),
                        icon: weatherCondition.contains("cloudy")
                            ? Icons.cloud
                            : weatherCondition.contains("rain")
                            ? Icons.cloudy_snowing
                            : weatherCondition.contains("snow")
                            ? Icons.severe_cold
                            : Icons.sunny,
                        temperature: "${hourlyData[index]['temp_c']}°C",
                      );
                    },
                  ),
                ),
                // additional info
                const SizedBox(height: 20),
                const Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItem(
                      icon: Icons.water_drop,
                      label: "Humdity",
                      value: currentHumdity.toString(),
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      label: "Windy km/h",
                      value: currentWindy.toString(),
                    ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: currentPressure.toString(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Future<String> readJsonFile() async {
//   try {
//     String fileRead = await File("/data/myData.json").readAsString();
//     return (fileRead);
//   } catch (e) {
//     throw Exception("Something went wrong $e");
//   }
// }
