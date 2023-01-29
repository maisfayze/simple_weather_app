import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/weather_model.dart';
import '../providers/weather_provider.dart';
import '../services/weather_services.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    Key? key,
  }) : super(key: key);
  String? cityName;
  // Function() updatUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              cityName = value;
              WeatherServices services = WeatherServices();
              WeatherModel weather =
                  await services.getWeather(cityName: cityName!);
              // Navigator.pop(context);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).CityName =
                  cityName;
              // updatUi();
              Navigator.pop(context);
              // print(weather);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 35, horizontal: 16),
                label: Text('Search a City'),
                hintText: 'Enter a city',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
          ),
        ),
      ),
    );
  }
}

// WeatherModel? weatherModel;
