import 'package:clinic/features/auth/controller/refresh_token_controller.dart';
import 'package:clinic/features/auth/controller/shared_preference.dart';
import 'package:clinic/features/auth/presentation/pages/login_first_page.dart';
import 'package:clinic/features/client/Home/presentation/pages/home.dart';
import 'package:clinic/features/client/Home/presentation/pages/master_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../client/NavigationBar/navigation_bar.dart';
import '../../technicians/NavigationBar/navigation_bar_for_tech.dart';
import 'check_exp_token.dart';


RefreshTokenController refreshTokenController = Get.put(RefreshTokenController());

void initialCheck() {
  // check if access token exist
  checkValue("access_token").then((result) {
    if (result == false) {
      //user is not logged before ( there is no key saved )
      // so we should navigate to login page
      Get.to(LoginFirstPage());
    } else {
      // getting the access token value from shared preference
      getStringValuesSF("access_token").then((token) {
        // checking if access token is expired or not
        var result_access = isTokenExpired(token!);
        if (result_access == true) {
          // the token is expired so we should check the status of refresh token
          // getting the refresh token value from shared preference
          getStringValuesSF("refresh_token").then((refresh_token_token) {
            // checking if refresh token is expired or not
            var result_refresh = isTokenExpired(refresh_token_token!);
            if (result_refresh == true) {
              // if refresh token is expired so we should ask the user login
              // so we should navigate to login page
              Get.to(LoginFirstPage());
            } else {
              // if refresh token is not expired so we should request for new access and refresh token
              refreshTokenController.getNewAccessToken();
              // and login the user automatically
             getStringValuesSF("user").then((user) {
               print(user);
               if(user == 'Supervisor'){
                 Get.off(Home());
               } else {
                 Get.off(Techpages());
               }
             });
            }
          });
        } else {
          // the access token is not expired so login the user automatically
          getStringValuesSF("user").then((user) {
            print(user);
            if(user == 'Supervisor'){
              Get.off(Home());
            } else {
              Get.off(Techpages());
            }
          });
        }
      });
    }
  });
}
