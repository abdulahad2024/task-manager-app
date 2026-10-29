import 'package:task_masenger_app/app/data/local/local_auth_storage.dart';
import 'package:task_masenger_app/export.dart';

class OnboardingController extends GetxController {


  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;

  final List<Map<String, String>> onboardingData = [
    {
      'image': AppImage.onboardingImageOne,
      'title': AppString.onboardingTitle1,
      'subtitle': AppString.onboardingSubtitle1,
    },
    {
      'image': AppImage.onboardingImageTwo,
      'title': AppString.onboardingTitle2,
      'subtitle': AppString.onboardingSubtitle2,
    },
    {
      'image': AppImage.onboardingImageThree,
      'title': AppString.onboardingTitle3,
      'subtitle': AppString.onboardingSubtitle3,
    },
  ];

  bool get isLastPage => currentIndex.value == onboardingData.length - 1;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }


  void previousPage() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void nextPage() async {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // অনবোর্ডিং শেষ, স্টোরেজে ফ্ল্যাগ সেভ করা হলো
      final storage = LocalAuthStorage();
      await storage.setOnboardingSeen();

      // যদি ইউজার ইতিমধ্যে লগইন করা থাকে তবে হোম পেজে যাবে, না হলে লগইন পেজে
      if (storage.isLoggedIn) {
        Get.offAllNamed(Routes.BOTTOM_NAV);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  void skipPage() async {
    final storage = LocalAuthStorage();
    await storage.setOnboardingSeen();

    if (storage.isLoggedIn) {
      Get.offAllNamed(Routes.BOTTOM_NAV);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }


  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}