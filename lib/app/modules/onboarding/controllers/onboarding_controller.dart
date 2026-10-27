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

  void nextPage() {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipPage() {
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}