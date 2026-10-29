import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/modules/task/widgets/common_app_bar.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

import '../controllers/my_profile_controller.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: CommonAppBar(
        title: AppString.myProfile,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
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
                    onTap: () {
                      Get.toNamed('${Routes.PROFILE}${Routes.EDIT_PROFILE}');                    },
                    child: const SizedBox(
                      width: 42,
                      height: 42,
                      child: Icon(
                        Ionicons.pencil,
                        size: 19,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // ২. বডি সেকশন
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          children: [
            const SizedBox(height: 10),

            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColor.primaryColor.withValues(alpha: 0.2),
                backgroundImage: const NetworkImage(
                  'https://avatars.githubusercontent.com/u/158837112?v=4',
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ইউজারের নাম (টাইটেল)
            const Center(
              child: CustomText(
                text: "Mojahid",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            _buildInfoCard(
              theme: theme,
              isDark: isDark,
              icon: Ionicons.person,
              text: "Mojahid Islam",
            ),
            const SizedBox(height: 12),

            _buildInfoCard(
              theme: theme,
              isDark: isDark,
              icon: Ionicons.mail,
              text: "Samaltman@gmail.com",
            ),
            const SizedBox(height: 12),

            _buildInfoCard(
              theme: theme,
              isDark: isDark,
              icon: Ionicons.location,
              text: "1234 Elm Street, Springfield, IL",
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildInfoCard({
    required ThemeData theme,
    required bool isDark,
    required IconData icon,
    required String text,
  }) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColor.primaryColor,
              size: 22,
            ),
            Container(
              height: 20,
              width: 1.5,
              color: AppColor.primaryColor.withValues(alpha: 0.5),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            Expanded(
              child: CustomText(
                text: text,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}