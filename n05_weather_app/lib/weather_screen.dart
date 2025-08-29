import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:n05_weather_app/additional_info_item.dart';
import 'package:n05_weather_app/hourly_forecast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "300° C",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 16),
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
      ),
    );
  }
}
