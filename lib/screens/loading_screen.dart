import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = "cc88a459238767c94c1b47a247847765";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location ls = Location();

  void getLocationData() async {
    await ls.getCurrentLocation();
    WeatherNetworkHelper weatherHelper = WeatherNetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${ls.latitude}&lon=${ls.longitude}&appid=$apiKey");

    await weatherHelper.getData();
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
