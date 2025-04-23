class ApiUrl {
  // BASE URL
  // static const String base = ''; // uat
  static const String base = 'http:420420'; // uat
  static String getApp = '$base/get-apps/';//get Api
  static String download = 'http:420420';//get Api

  // Auth URL
  static String login = '$base/api/auth/login';
  static String saveApp = '$base/save-app/';

  static  String uploadBase = '$base/doc_upload/';
  static String checkUserName = '$base/api/auth/checkUsername';
  static String verifyOtp = '$base/api/auth/verifyOtpForgetPassword';
  static String forgotPassword = '$base/api/auth/forgetPassword';
  // -- Dashboard URL
  static String credit = '$base/api/wallet/creditDebit';

  // --Reports URL
  static String allTransactionReport = '$base/uat/api/wallet/txnReport';
}
