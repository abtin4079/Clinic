import 'package:shared_preferences/shared_preferences.dart';

addStringToSP(String key, String? value, String key2, String? value2) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value!);
  prefs.setString(key2, value2!);
}

Future<String?> getStringValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? stringValue = prefs.getString(key);
  return stringValue;
}

removeValues(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

Future<bool> checkValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool CheckValue = prefs.containsKey(key);
  return CheckValue;
}
