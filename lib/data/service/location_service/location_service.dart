import 'package:geolocator/geolocator.dart';
import 'package:quick_meet/data/models/local/app_geolocation_model.dart';
import 'package:quick_meet/data/service/location_service/interface/location_interface.dart';

class LocationService implements AppLocation {
  final defLocation = const MoscowLocation();

  @override
  Future<AppLocationModel> getCurrentLocation() async {
    return Geolocator.getCurrentPosition().then((value) {
      return AppLocationModel(lat: value.latitude, long: value.longitude);
    }).catchError(
      (_) => defLocation,
    );
  }

  @override
  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) => value == LocationPermission.always || value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  @override
  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((value) => value == LocationPermission.always || value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }
}
