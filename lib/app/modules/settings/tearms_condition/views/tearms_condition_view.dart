import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/modules/task/widgets/common_app_bar.dart';

import '../controllers/tearms_condition_controller.dart';

class TermsConditionView extends GetView<TearmsConditionController> {
  const TermsConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      // কমন অ্যাপবার
      appBar: const CommonAppBar(
        title: AppString.termsTitle,
      ),

      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          children: [
            // ১. মূল শিরোনাম (Terms & Conditions)
            const CustomText(
              text: "Terms & Conditions",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),

            // ওয়েলকাম ডেসক্রিপশন
            CustomText(
              text: AppString.termsWelcome,
              fontSize: 14,
              color: isDark ? Colors.white70 : Colors.black87,
              height: 1.5,
            ),
            const SizedBox(height: 20),

            // ২. পয়েন্ট ১
            _buildTermItem(
              title: AppString.term1Title,
              desc: AppString.term1Desc,
              isDark: isDark,
            ),

            // ৩. পয়েন্ট ২
            _buildTermItem(
              title: AppString.term2Title,
              desc: AppString.term2Desc,
              isDark: isDark,
            ),

            // ৪. পয়েন্ট ৩
            _buildTermItem(
              title: AppString.term3Title,
              desc: AppString.term3Desc,
              isDark: isDark,
            ),

            // ৫. পয়েন্ট ৪
            _buildTermItem(
              title: AppString.term4Title,
              desc: AppString.term4Desc,
              isDark: isDark,
            ),

            // ৬. পয়েন্ট ৫
            _buildTermItem(
              title: AppString.term5Title,
              desc: AppString.term5Desc,
              isDark: isDark,
            ),

            // ৭. পয়েন্ট ৬
            _buildTermItem(
              title: AppString.term6Title,
              desc: AppString.term6Desc,
              isDark: isDark,
            ),

            // ৮. পয়েন্ট ৭
            _buildTermItem(
              title: AppString.term7Title,
              desc: AppString.term7Desc,
              isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }

  // ── স্ক্রিনশটের স্টাইল অনুযায়ী সিম্পল লিস্ট আইটেম উইজেট ──
  Widget _buildTermItem({
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