class AppLocationModel {
  final double lat;
  final double long;

  const AppLocationModel({
    required this.lat,
    required this.long,
  });
}

class MoscowLocation extends AppLocationModel {
  const MoscowLocation({
    super.lat = 55.7522200,
    super.long = 37.6155600,
  });
}
