import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/modules/task/widgets/common_app_bar.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

import '../controllers/account_settings_controller.dart';

class AccountSettingsView extends GetView<AccountSettingsController> {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: const CommonAppBar(title: "Account Setting"),

      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          children: [
            SettingCard(
              theme: theme,
              isDark: isDark,
              icon: Ionicons.lockClosed,
              iconColor: AppColor.primaryColor,
              title: "Change Password",
              titleColor: isDark ? Colors.white : Colors.black87,
              onTap: () {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              },
            ),
            const SizedBox(height: 14),

            SettingCard(
              theme: theme,
              isDark: isDark,
              icon: Ionicons.personRemove,
              iconColor: Colors.redAccent,
              title: "Delete Account",
              titleColor: Colors.redAccent,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  const new({
    super.key,
    required this.theme,
    required this.isDark,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.titleColor,
    required this.onTap,
  });

  final ThemeData theme;
  final bool isDark;
  final IconData icon;
  final Color iconColor;
  final String title;
  final Color titleColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 22),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomText(
                    text: title,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                const Icon(Ionicons.arrowForward, color: Colors.grey, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
