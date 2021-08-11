import 'package:geolocator/geolocator.dart';

class Location {
  Future<List<dynamic>> getCurrentLocation() async {
    List<dynamic> userSearchItems = [];

    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        userSearchItems.add("No tiene permiso para acceder a la ubicacion");
      } else {
        var position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        userSearchItems.add(position.latitude);
        userSearchItems.add(position.longitude);
      }
    } else {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      userSearchItems.add(position.latitude);
      userSearchItems.add(position.longitude);
    }

    return userSearchItems.toList();
  }
}
