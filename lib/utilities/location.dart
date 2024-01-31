import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 10));
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      throw '$e';
    }
  }
}
