import 'package:payapp/helper/route_helper.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) {
    if (response.statusCode == 401) {
      Get.offAllNamed(GetPlatform.isWeb
          ? RouteHelper.getInitialRoute()
          : RouteHelper.getSignInRoute(RouteHelper.splash));
    }
  }
}
