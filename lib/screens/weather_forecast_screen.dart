import 'package:flutter/material.dart';
import 'package:weather_app_flutter_project/api/weather_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_flutter_project/screens/city_screen.dart';
import 'package:weather_app_flutter_project/widgets/bottom_listview.dart';
import 'package:weather_app_flutter_project/widgets/city_view.dart';
import 'package:weather_app_flutter_project/widgets/temp_view.dart';

import '../models/weather_forecast_daily.dart';
import '../widgets/detail_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    // forecastObject!.then((value) {
    //   print(value.list![0].weather![0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Weather Forecast',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.my_location, color: Colors.white)),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return CityScreen();
                }));
                setState(() {
                  if (tappedName != null && tappedName.length != 0) {
                    _cityName = tappedName;
                    forecastObject = WeatherApi()
                        .fetchWeatherForecastWithCity(cityName: _cityName);
                  }
                });
              },
              icon: Icon(Icons.location_city, color: Colors.white))
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        CityView(snapshot: snapshot),
                        SizedBox(height: 50),
                        TempView(snapshot: snapshot),
                        SizedBox(height: 50),
                        DetailView(snapshot: snapshot),
                        SizedBox(height: 50),
                        BottomListView(snapshot: snapshot),
                      ],
                    );
                  } else {
                    return const Center(
                      child: SpinKitDoubleBounce(
                        color: Colors.black87,
                        size: 100,
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
