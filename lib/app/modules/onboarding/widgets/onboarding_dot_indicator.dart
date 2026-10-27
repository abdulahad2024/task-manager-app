import 'package:task_masenger_app/export.dart';

class DotIndicator extends StatelessWidget {
  const new({super.key, required this.controller});

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.onboardingData.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: controller.currentIndex.value == index ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: controller.currentIndex.value == index
                  ? AppColor.primaryColor
                  : AppColor.grey300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
