import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherServices {
  String base_url = 'http://api.weatherapi.com/v1/';
  String apiKey = '9c636b8235764aefa89164120232501';
  Future<WeatherModel> getWeather({required String cityName}) async {
    String city_url = base_url + 'forecast.json?key=$apiKey&q=$cityName&days=7';
    Uri url = Uri.parse(city_url);
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    // WeatherModel weather = WeatherModel(
    //     date: data['location']['localtime'],
    //     temp: data['forecast']['forecastday'][0]['avgtemp_c'],
    //     maxTemp: data['forecast']['forecastday'][0]['maxtemp_c'],
    //     minTemp: data['forecast']['forecastday'][0]['mintemp_c'],
    //     weatherStateName: data['forecast']['forecastday'][0]['condition']
    //         ['text']);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
