import 'package:task_masenger_app/export.dart';

class OnboardingData extends StatelessWidget {
  const OnboardingData({super.key, required this.controller});

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: PageView.builder(
        controller: controller.pageController,
        itemCount: controller.onboardingData.length,
        onPageChanged: controller.onPageChanged,
        itemBuilder: (context, index) {
          final data = controller.onboardingData[index];

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    data['image']!,
                    height: 260,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40),

                  CustomText(
                    text: data['title']!,
                    textAlign: TextAlign.center,
                    color: theme.textTheme.headlineSmall?.color,
                    fontSize: theme.textTheme.headlineSmall?.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 12),

                  CustomText(
                    text: data['subtitle']!,
                    textAlign: TextAlign.center,
                    color: theme.textTheme.bodyMedium?.color,
                    fontSize: theme.textTheme.bodyMedium?.fontSize ?? 14,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
