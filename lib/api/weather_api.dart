import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:developer';

import '../models/weather_forecast_daily.dart';
import '../utilities/constants.dart';
import '../utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Map<String, String> parameters;

    if (isCity == true) {
      parameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName!
      };
    } else {
      Location location = Location();
      await location.getCurrentLocation();
      parameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString()
      };
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }
}
