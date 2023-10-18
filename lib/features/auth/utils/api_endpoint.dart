class ApiEndPoints {
  static final String BaseUrl = 'http://185.221.237.51/auth/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String sendOTP = 'sendotp';
  final String login = 'login';
}