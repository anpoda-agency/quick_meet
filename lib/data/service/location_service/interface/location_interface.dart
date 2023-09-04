import 'package:quick_meet/data/models/local/app_geolocation_model.dart';

abstract class AppLocation {
  Future<AppLocationModel> getCurrentLocation();

  Future<bool> requestPermission();

  Future<bool> checkPermission();
}
