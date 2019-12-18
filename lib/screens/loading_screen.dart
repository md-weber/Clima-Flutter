import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = "cc88a459238767c94c1b47a247847765";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location ls = Location();

  void getLocation() async {
    await ls.getCurrentLocation();
    getData();
  }

  void getData() async {
    print("${ls.longitude} ${ls.latitude}");
    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=${ls.latitude}&lon=${ls.longitude}&appid=$apiKey");

    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      String cityName = jsonData["name"];
      int condition = jsonData["weather"][0]["id"];
      double temperature = jsonData["main"]["temp"];
      print("$cityName $condition $temperature");
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
