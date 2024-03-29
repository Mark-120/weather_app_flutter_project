import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: 'Enter the name of city',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        filled: true,
                        fillColor: Colors.black87,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none),
                        icon: Icon(
                          Icons.location_city,
                          color: Colors.black87,
                          size: 50,
                        )),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    'Get weather',
                    style: TextStyle(fontSize: 30, color: Colors.black87),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
