import 'package:flutter/material.dart';

import '../utilities/forecast_util.dart';
import '../models/weather_forecast_daily.dart';

class CityView extends StatelessWidget {
  const CityView({super.key, required this.snapshot});

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    String city = snapshot.data!.city!.name!;
    String country = snapshot.data!.city!.country!;
    DateTime formattedDate = DateTime.fromMillisecondsSinceEpoch(snapshot.data!.list![0].dt! * 1000);

    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          Text(
            '${Util.getFormattedDate(formattedDate)}', style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
