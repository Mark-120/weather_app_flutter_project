import 'package:flutter/material.dart';

import '../models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  const TempView({super.key, required this.snapshot});

  final AsyncSnapshot<WeatherForecast> snapshot;


  @override
  Widget build(BuildContext context) {

    var forecastList = snapshot.data!.list!;
    var iconUrl = forecastList[0].getIconUrl();
    var temp = forecastList[0].temp!.day!.toStringAsFixed(0);
    var description = forecastList[0].weather![0].description!;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(iconUrl, color: Colors.black87, scale: 0.7,),
          SizedBox(width: 15,),
          Column(
            children: [
              Text('$temp °C', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.black87),),
              Text('$description', style: TextStyle(fontSize: 18, color: Colors.black87),)
            ],
          ),
        ],
      ),
    );
  }
}