import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_flutter_project/api/weather_api.dart';
import 'package:weather_app_flutter_project/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    var weatherInfo = await WeatherApi().fetchWeatherForecast();

    if (weatherInfo == null) {
      log('weatherInfo is null!');
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastScreen(
        locationWeather: weatherInfo,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.black87,
        size: 100,
      )),
    );
  }
}
