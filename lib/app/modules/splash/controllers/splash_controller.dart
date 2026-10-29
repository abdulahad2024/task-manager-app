import 'package:task_masenger_app/app/data/local/local_auth_storage.dart';
import 'package:task_masenger_app/export.dart';

class SplashController extends GetxController {
  final LocalAuthStorage _storage = LocalAuthStorage();

  @override
  void onReady() {
    super.onReady();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    // ২ সেকেন্ড স্প্ল্যাশ স্ক্রিন ডিলে
    await Future.delayed(const Duration(seconds: 2));

    // লোকাল স্টোরেজ থেকে চেক করা
    bool hasSeenOnboarding = _storage.getHasSeenOnboarding();
    bool isLoggedIn = _storage.isLoggedIn;

    // কন্ডিশন অনুযায়ী সঠিক পেজে রিডাইরেক্ট করা
    if (!hasSeenOnboarding) {
      // প্রথমবার অ্যাপ ওপেন করলে অনবোর্ডিং পেজে যাবে
      Get.offAllNamed(Routes.ONBOARDING);
    } else {
      if (isLoggedIn) {
        // ইউজার লগইন করা থাকলে সরাসরি হোম/বটম ন্যাভ পেজে যাবে
        Get.offAllNamed(Routes.BOTTOM_NAV);
      } else {
        // অনবোর্ডিং দেখা শেষ কিন্তু লগইন করা না থাকলে লগইন পেজে যাবে
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }
}