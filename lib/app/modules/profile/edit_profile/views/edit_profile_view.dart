import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text_feild.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/modules/task/widgets/common_app_bar.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      // ১. কমন অ্যাপবার
      appBar: const CommonAppBar(
        title: "Edit Profile",
      ),

      // ২. বডি সেকশন
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColor.primaryColor.withValues(alpha: 0.2),
                    backgroundImage: const NetworkImage(
                      'https://avatars.githubusercontent.com/u/158837112?v=4',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.primaryColor, width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Ionicons.camera,
                        size: 16,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            CustomTextFromField(
              label: AppString.firstName,
              hint: AppString.hintFirstName,
              keyboardType: TextInputType.name,
              onChanged: (value) {},
            ),

            const SizedBox(height: 15),

            CustomTextFromField(
              label: AppString.lastName,
              hint: AppString.hintLastName,
              keyboardType: TextInputType.name,
              onChanged: (value) {},
            ),

            const SizedBox(height: 15),


            CustomTextFromField(
              label: AppString.emailAddress,
              hint: AppString.hintEmail,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
            ),

            const SizedBox(height: 15),

            CustomTextFromField(
              label: AppString.address,
              hint: AppString.hintAddress,
              keyboardType: TextInputType.streetAddress,
              onChanged: (value) {},
            ),
            const SizedBox(height: 30),


            CustomButton(
              text: "Update",
              onPressed: () {

              },
            ),


            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }

  // ── লেবেল এবং টেক্সট ফিল্ড তৈরি করার হেল্পার মেথড ──
  Widget _buildTextField({
    required String label,
    required String hintText,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white70 : Colors.black87,
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white38 : Colors.black38,
            ),
            filled: true,
            // স্ক্রিনশটের মতো হালকা সবুজ বা সফট ব্যাকগ্রাউন্ড কালার
            fillColor: AppColor.primaryColor.withValues(alpha: 0.05),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColor.primaryColor, width: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}