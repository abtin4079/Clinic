import 'package:clinic/features/auth/controller/login_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class RefreshTokenController extends GetxController{
  final FlutterSecureStorage secureStorage;
//  final FlutterSecureStorage secureStorage = Get.put(FlutterSecureStorage());
  RefreshTokenController(this.secureStorage);

  // storing data
  Future<void> storeAccessToken() async {
    await secureStorage.write(key: 'authToken', value: 'your_auth_token_here');
  }
  // deleting data
  Future<void> deleteAccessToken(String key) async {
    await secureStorage.delete(key: key);
  }

  // retrieve data
  Future<String?> retrieveAccessToken() async {
    String? access_token = await secureStorage.read(key: 'access_token');
    return access_token;
  }

}