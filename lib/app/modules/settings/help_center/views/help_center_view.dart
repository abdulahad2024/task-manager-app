import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/modules/task/widgets/common_app_bar.dart';

import '../controllers/help_center_controller.dart';

class HelpCenterView extends GetView<HelpCenterController> {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: const CommonAppBar(title: AppString.faqTitle),

      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          children: [
            const CustomText(
              text: AppString.faqTitle,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 12),

            ...AppString.faqList.map((faq) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
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
                child: Theme(
                  data: theme.copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    title: CustomText(
                      text: faq['question'] ?? '',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                    iconColor: AppColor.primaryColor,
                    collapsedIconColor: AppColor.primaryColor,
                    children: [
                      const Divider(height: 1, color: Colors.black12),
                      const SizedBox(height: 12),
                      CustomText(
                        text: faq['answer'] ?? '',
                        fontSize: 13.5,
                        color: isDark
                            ? Colors.white60
                            : AppColor.secondaryTextColor,
                        height: 1.5,
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 10),

            // ৪. Need More Help? সেকশন
            const CustomText(
              text: AppString.faqHelpTitle,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
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
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Ionicons.headset,
                      color: AppColor.primaryColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: "Mail Us: (support@taskmanagerapp.com)",
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                        const SizedBox(height: 4),
                        CustomText(
                          text: "Our help desk is available 24/7 to support your workflow.",
                          fontSize: 12,
                          color: isDark
                              ? Colors.white60
                              : AppColor.secondaryTextColor,
                          height: 1.4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
