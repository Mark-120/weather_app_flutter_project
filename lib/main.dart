import 'package:flutter/material.dart';
import 'package:weather_app_flutter_project/screens/location_screen.dart';

import 'screens/weather_forecast_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LocationScreen(),
      debugShowCheckedModeBanner: false
    );
  }
}
