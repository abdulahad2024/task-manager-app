import 'package:task_masenger_app/export.dart';

class OnboardingTopBar extends StatelessWidget {
  const new({super.key, required this.controller});

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Obx(
              () => controller.currentIndex.value > 0
                  ? IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: controller.previousPage,
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),

          Obx(
            () => controller.isLastPage
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: controller.skipPage,
                    child: const Text(
                      AppString.skip,
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
