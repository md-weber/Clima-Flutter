import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position location = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);

      longitude = location.longitude;
      latitude = location.latitude;
    } catch (e) {
      print(e);
    }
  }
}
