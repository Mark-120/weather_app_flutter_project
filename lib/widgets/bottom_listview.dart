import 'package:flutter/material.dart';
import 'package:weather_app_flutter_project/widgets/forecast_card.dart';

import '../models/weather_forecast_daily.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomListView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('7-Day Weather Forecast'.toUpperCase(),
            style: TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.bold)),
        Container(
          height: 160,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 160,
                  color: Colors.black87,
                  child: forecastCard(snapshot, index),
                );
              }),
              separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
              itemCount: 7),
        )
      ],
    );
  }
}
