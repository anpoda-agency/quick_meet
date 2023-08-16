abstract class AppConstants {
  static const String icons = 'images/icons/';
  // static const String domain = '84.201.161.194:8080/api/v1';

  static const bool makeCurl = true;
  static const bool writeLogs = false;
  static const bool netLogs = true;
  static const bool printLogChangeNotify = false;
  static const bool storageSQfliteLogs = false;
  static const bool makeCurlClipboard = false;

  // base url
  static const String baseUrl = "https://84.201.161.194:8080/api/v1";

  //activation-code-controller urls
  static const String sendUrl = "/auth/code/send";
  static const String confirmUrl = "/auth/code/confirm";
}
