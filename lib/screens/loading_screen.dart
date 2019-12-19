import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = "cc88a459238767c94c1b47a247847765";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location ls = Location();

  void getLocationData() async {
    await ls.getCurrentLocation();
    NetworkHelper weatherHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${ls.latitude}&lon=${ls.longitude}&appid=$apiKey&units=metric");

    var weatherData = await weatherHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(locationWeather: weatherData)),
    );
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
