import 'package:clinic/features/auth/controller/shared_preference.dart';
import 'package:clinic/features/auth/controller/check_exp_token.dart';
import 'package:clinic/features/auth/controller/refresh_token_controller.dart';
import 'package:clinic/features/auth/presentation/pages/login_first_page.dart';
import 'package:get/get.dart';

RefreshTokenController refreshTokenController =
    Get.put(RefreshTokenController());
void tokenCheckBeforeRequest() {
  // checking access token is expired or not
  getStringValuesSF("access_token").then((token) {
    //checking if access_token is expired
    var result_access = isTokenExpired(token!);
    if (result_access == true) {
      getStringValuesSF("refresh_token").then((refresh_token_token) {
        var result_refresh = isTokenExpired(refresh_token_token!);
        if (result_refresh == true) {
          Get.to(LoginFirstPage());
        } else {
          //request for new token and replace it
          refreshTokenController.getNewAccessToken();
        }
      });
    }
  });
}
