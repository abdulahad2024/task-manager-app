import 'package:task_masenger_app/export.dart';
class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {

    await Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.ONBOARDING);
    });

  }
}