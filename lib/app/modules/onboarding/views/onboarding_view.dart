import 'package:task_masenger_app/export.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              OnboardingTopBar(controller: controller),

              OnboardingData(controller: controller),

              const SizedBox(height: 16),

              DotIndicator(controller: controller),

              const SizedBox(height: 32),

              Obx(
                    () => CustomButton(
                  text: controller.isLastPage
                      ? AppString.continueText
                      : AppString.next,
                  onPressed: () {
                    controller.nextPage();
                  },
                  icon: Icons.arrow_forward_ios,
                  isIconRight: true,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}