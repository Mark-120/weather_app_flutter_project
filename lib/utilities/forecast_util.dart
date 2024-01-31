import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime); //Mon, Jun 5, 2018
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(iconData, color: Colors.black87, size: 32,),
        SizedBox(height: 15,),
        Text('${value}', style: TextStyle(fontSize: 25, color: Colors.black),),
        SizedBox(height: 5,),
        Text('${units}', style: TextStyle(fontSize: 18, color: Colors.black87),),
      ],
    );
  }
}