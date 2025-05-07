import 'package:get/get.dart';
import 'package:shadow_monarch/app/routes/app_pages.dart';
import 'package:shadow_monarch/app/utils/constants.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Constants.splashDuration);
    Get.offAllNamed(Routes.HOME);
  }
}
