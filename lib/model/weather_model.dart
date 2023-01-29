import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String icon;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.icon});

  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
        date: data['current']['last_updated'],
        temp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherStateName: data['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        icon: data['forecast']['forecastday'][0]['day']['condition']['icon']);
  }

  @override
  String toString() {
    return 'WeatherModel{date: $date, temp: $temp, maxTemp: $maxTemp, minTemp: $minTemp, weatherStateName: $weatherStateName, icon: $icon}';
  }

  String getImage() {
    if (weatherStateName == 'Sunny') {
      return 'https://cdn-icons-png.flaticon.com/512/3222/3222808.png';
    } else if (weatherStateName == 'Partly cloudy') {
      return 'https://cdn-icons-png.flaticon.com/512/5493/5493155.png';
    } else if (weatherStateName == 'Cloudy') {
      return 'https://cdn-icons-png.flaticon.com/512/2242/2242879.png';
    } else if (weatherStateName == 'Overcast') {
      return 'https://cdn-icons-png.flaticon.com/512/1146/1146869.png';
    } else if (weatherStateName == 'mist') {
      return 'https://cdn-icons-png.flaticon.com/512/4005/4005901.png';
    } else if (weatherStateName == 'Thundery outbreaks possible') {
      return 'https://cdn-icons-png.flaticon.com/512/1146/1146860.png';
    } else if (weatherStateName == 'Freezing fog') {
      return 'https://cdn-icons-png.flaticon.com/512/2248/2248058.png';
    }
    return 'https://cdn-icons-png.flaticon.com/512/3845/3845731.png';
  }

  MaterialColor getTheme() {
    if (weatherStateName == 'Sunny') {
      return Colors.yellow;
    } else if (weatherStateName == 'Partly cloudy') {
      return Colors.grey;
    } else if (weatherStateName == 'Cloudy') {
      return Colors.deepPurple;
    } else if (weatherStateName == 'Overcast') {
      return Colors.grey;
    } else if (weatherStateName == 'mist') {
      return Colors.indigo;
    } else if (weatherStateName == 'Thundery outbreaks possible') {
      return Colors.red;
    } else if (weatherStateName == 'Freezing fog') {
      return Colors.grey;
    }
    return Colors.lightGreen;
  }
}
