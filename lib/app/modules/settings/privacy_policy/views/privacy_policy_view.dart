import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/modules/task/widgets/common_app_bar.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      // কমন অ্যাপবার ব্যবহার করা হলো
      appBar: const CommonAppBar(
        title: AppString.privacyTitle,
      ),

      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          children: [
            // ১. মূল শিরোনাম এবং সাবটাইটেল / ইন্ট্রোডাকশন
            const CustomText(
              text: AppString.privacyTitle,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),

            CustomText(
              text: AppString.privacySubtitle,
              fontSize: 14,
              color: isDark ? Colors.white70 : Colors.black87,
              height: 1.5,
            ),
            const SizedBox(height: 20),

            // ২. লিস্ট থেকে ডাইনামিকভাবে প্রিভেসি পলিসির পয়েন্টগুলো রেন্ডার করা
            ...AppString.privacyList.map((policy) {
              return _buildPrivacyItem(
                title: policy['title'] ?? '',
                desc: policy['desc'] ?? '',
                isDark: isDark,
              );
            }),

            // ৩. কন্টাক্ট ইনফো ফুটার সেকশন
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomText(
                text: AppString.privacyContactText,
                fontSize: 13.5,
                color: AppColor.primaryColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── পলিসি লিস্ট আইটেম উইজেট ──
  Widget _buildPrivacyItem({
    required String title,
    required String desc,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
          const SizedBox(height: 6),
          CustomText(
            text: desc,
            fontSize: 13.5,
            color: isDark ? Colors.white60 : Colors.black87,
            height: 1.5,
          ),
        ],
      ),
    );
  }
}