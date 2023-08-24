abstract class AppConstants {
  static const String icons = 'images/icons/';

  static const bool makeCurl = true;
  static const bool writeLogs = false;
  static const bool netLogs = true;
  static const bool printLogChangeNotify = false;
  static const bool storageSQfliteLogs = false;
  static const bool makeCurlClipboard = false;

  // base url
  static const String baseUrl = "http://158.160.66.136:8080/api/v1";

  //activation-code-controller urls
  static const String sendUrl = "/auth/code/send";
  static const String confirmUrl = "/auth/code/confirm";

  //auth-controller urls
  static const String verificationLoginUrl = "/auth/verification-login";
  static const String loginUrl = "/auth/login";
  static const String refreshTokenUrl = "/auth/refresh/"; // + {path}
  static const String regsiterUrl = "/auth/register";
  static const String resetPasswordUrl = "/auth/resetPassword";
  //static const String updatePasswordUrl = "/auth/updatePassword"; //does not exist in mvp

  //user-controller urls
  static const String getIdUrl = '/user-management/user/'; // + {path}
  /* static const String 
  static const String 
  static const String 
  static const String 
  static const String 
  static const String  */
}
