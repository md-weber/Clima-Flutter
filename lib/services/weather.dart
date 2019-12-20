import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "cc88a459238767c94c1b47a247847765";
const openWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location ls = Location();
    await ls.getCurrentLocation();
    NetworkHelper weatherHelper = NetworkHelper(
        "$openWeatherMapUrl?lat=${ls.latitude}&lon=${ls.longitude}&appid=$apiKey&units=metric");

    return await weatherHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
