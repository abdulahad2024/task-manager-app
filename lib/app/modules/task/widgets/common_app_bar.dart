import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import '../../../core/constants/color/app_color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  const CommonAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 64,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Center(
          child: Card(
            shape: const CircleBorder(),
            child: Material(
              color: AppColor.softColor,
              shape: const CircleBorder(
                side: BorderSide(color: AppColor.primaryColor, width: 1.1),
              ),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onBackPressed ?? () => Get.back(),
                child: const SizedBox(
                  width: 42,
                  height: 42,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 19,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      title: CustomText(
        text: title,
        fontSize: theme.textTheme.titleLarge?.fontSize,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}