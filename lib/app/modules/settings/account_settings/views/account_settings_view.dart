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
    final controller = Get.put(AccountSettingsController());
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const CommonAppBar(title: "Account Settings"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // সেকশন হেডার
              CustomText(
                text: "Security & Privacy",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
              const SizedBox(height: 12),

              // সেটিংস কার্ড লিস্ট
              SettingCard(
                theme: theme,
                isDark: isDark,
                icon: Ionicons.lockClosed,
                iconColor: AppColor.primaryColor,
                title: "Change Password",
                subtitle: "Update your password regularly",
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
                subtitle: "Permanently delete your account and data",
                titleColor: Colors.redAccent,
                onTap: () {
                  controller.showDeleteConfirmationDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    required this.theme,
    required this.isDark,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.titleColor,
    required this.onTap,
  });

  final ThemeData theme;
  final bool isDark;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Color titleColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.04),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // আইকন ব্যাকগ্রাউন্ড সার্কেল
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                const SizedBox(width: 16),

                // টাইটেল এবং সাবটাইটেল
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: subtitle,
                        fontSize: 12,
                        color: isDark ? Colors.white54 : Colors.black54,
                      ),
                    ],
                  ),
                ),

                // ফরওয়ার্ড অ্যারো আইকন
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Ionicons.arrowForward,
                    color: isDark ? Colors.white60 : Colors.grey,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}