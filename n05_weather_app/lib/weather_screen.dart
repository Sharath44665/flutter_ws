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
  Future getCurrentWeather() async {
    // below code is quite tedious, because in case of something goes wrong, it will throw error + its continuously loading
    try {
      final res = await http.get(
        Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$lon%2074.826337&days=1&aqi=no&alerts=no",
        ),
      );

      if (res.statusCode != 200) {
        throw "an unaccepted error occured";
      }
      final data = jsonDecode(res.body);
      // temp = data['forecast']['forecastday'][0]['day']['avgtemp_c'];
      return data;
    } catch (e) {
      throw e.toString();
    }
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
              debugPrint("refresh clicked");
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          print(
            snapshot,
          ); // AsyncSnapshot<dynamic>(ConnectionState.waiting, null, null, null)
          print(
            "Type: ${snapshot.runtimeType}",
          ); // Type: AsyncSnapshot<dynamic>
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
                                "value° C",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Icon(Icons.cloud, size: 64),
                              const SizedBox(height: 16),
                              Text("Rain", style: TextStyle(fontSize: 20)),
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
                  "Weather Forecast",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HourlyForecastItem(
                        time: "0:00",
                        icon: Icons.cloud,
                        temperature: "22°C",
                      ),
                      HourlyForecastItem(
                        time: "1:00",
                        icon: Icons.wb_sunny,
                        temperature: "24°C",
                      ),
                      HourlyForecastItem(
                        time: "2:00",
                        icon: Icons.cloud,
                        temperature: "21°C",
                      ),
                      HourlyForecastItem(
                        time: "3:00",
                        icon: Icons.grain,
                        temperature: "20°C",
                      ),
                      HourlyForecastItem(
                        time: "4:00",
                        icon: Icons.wb_cloudy,
                        temperature: "19°C",
                      ),
                      HourlyForecastItem(
                        time: "5:00",
                        icon: Icons.nights_stay,
                        temperature: "18°C",
                      ),
                    ],
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
                      value: "91",
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      label: "Windy",
                      value: "7.5",
                    ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: "1000",
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
