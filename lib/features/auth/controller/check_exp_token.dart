import 'package:jwt_decoder/jwt_decoder.dart';

bool isTokenExpired(String token) {
  try {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    if (decodedToken.containsKey("exp")) {
      int expirationTimestamp = decodedToken["exp"];
      int currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      return currentTimestamp > expirationTimestamp;
    }
  } catch (e) {
    print("Error decoding or checking token: $e");
  }

  return true;
}
