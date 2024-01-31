import 'package:flutter/material.dart';
import 'package:weather_app_flutter_project/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var date = DateTime.fromMillisecondsSinceEpoch(
      snapshot.data!.list![index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = fullDate.split(',')[0];

  var tempMin = snapshot.data!.list![index].temp!.min!.toStringAsFixed(0);
  var iconUrl = snapshot.data!.list![index].getIconUrl();

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dayOfWeek,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('$tempMin °C', style: TextStyle(fontSize: 30, color: Colors.white),),
                  ),
                  Image.network(iconUrl, scale: 1, color: Colors.white,)
                ],
              )
            ],
          )
        ],
      ),
    ],
  );
}
