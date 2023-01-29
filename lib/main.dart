import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/providers/weather_provider.dart';

import 'model/weather_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(), child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            weatherData == null ? Colors.green : weatherData!.getTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
