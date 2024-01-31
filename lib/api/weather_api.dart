import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:developer';

import '../models/weather_forecast_daily.dart';
import '../utilities/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity({required String cityName}) async {
    var parameters = {
      'appid': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, parameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Something went wrong');
    }
  }
}