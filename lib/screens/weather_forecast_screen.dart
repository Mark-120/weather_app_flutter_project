import 'package:flutter/material.dart';
import 'package:weather_app_flutter_project/api/weather_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_flutter_project/screens/city_screen.dart';
import 'package:weather_app_flutter_project/widgets/bottom_listview.dart';
import 'package:weather_app_flutter_project/widgets/city_view.dart';
import 'package:weather_app_flutter_project/widgets/temp_view.dart';

import '../models/weather_forecast_daily.dart';
import '../widgets/detail_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  WeatherForecast? locationWeather;

  WeatherForecastScreen({super.key, required this.locationWeather});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  String? _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Weather Forecast',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              setState(() {
                forecastObject = WeatherApi().fetchWeatherForecast();
              });
            },
            icon: Icon(Icons.my_location, color: Colors.white)),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return CityScreen();
                }));
                setState(() {
                  if (tappedName != null && tappedName.length != 0) {
                    _cityName = tappedName;
                    forecastObject = WeatherApi().fetchWeatherForecast(
                        cityName: _cityName, isCity: true);
                  }
                });
              },
              icon: Icon(Icons.location_city, color: Colors.white))
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(height: 25),
                        CityView(snapshot: snapshot),
                        SizedBox(height: 50),
                        TempView(snapshot: snapshot),
                        SizedBox(height: 50),
                        DetailView(snapshot: snapshot),
                        SizedBox(height: 50),
                        BottomListView(snapshot: snapshot),
                        SizedBox(height: 25),
                      ],
                    );
                  } else {
                    return const Center(
                        child: Text(
                      'City not found\nPlease enter correct city',
                      style: TextStyle(fontSize: 35),
                      textAlign: TextAlign.center,
                    ));
                  }
                }),
          )
        ],
      ),
    );
  }
}
