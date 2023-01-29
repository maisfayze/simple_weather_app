import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/search_page.dart';

import '../model/weather_model.dart';
import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

WeatherModel? weatherData;

class _HomePageState extends State<HomePage> {
  // WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getTheme(),
                weatherData!.getTheme()[300]!,
                weatherData!.getTheme()[100]!,
              ], begin: Alignment.topCenter)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    '${Provider.of<WeatherProvider>(context).CityName}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('${weatherData!.date}'),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: NetworkImage('${weatherData!.getImage()}'),
                        height: 50,
                        width: 50,
                      ),
                      // Image.network(
                      //   'http://cdn.weatherapi.com/weather/64x64/day/176.png',
                      //   height: 50,
                      //   width: 50,
                      // ),
                      Text('${weatherData!.temp}'),
                      Column(
                        children: [
                          Text('Max temp :${weatherData!.maxTemp.toInt()}'),
                          Text('Min temp :${weatherData!.minTemp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    '${weatherData!.weatherStateName}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
    );
  }
}
