import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_otp_field.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';

import '../controllers/verify_code_controller.dart';

class VerifyCodeView extends GetView<VerifyCodeController> {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      CustomText(
                        text: AppString.verifyOtpTitle,
                        color: theme.textTheme.headlineMedium?.color,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 8),

                      CustomText(
                        text: AppString.verifyOtpSubtitle,
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 14,
                      ),

                      const SizedBox(height: 8),

                      CustomText(
                        text: controller.email.isNotEmpty
                            ? controller.email
                            : "email@example.com",
                        color: AppColor.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),

                      const SizedBox(height: 32),

                      CustomOtpField(
                        length: 6,
                        boxSize: 45.0,
                        onChanged: (value) {
                          controller.onOtpChanged(value);
                        },
                      ),

                      const SizedBox(height: 40),

                      Obx(() => CustomButton(
                        text: AppString.confirm,
                        isLoading: controller.isLoading.value,
                        onPressed: () {
                          controller.verifyEmail(context);
                        },
                      ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}