import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_otp_field.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

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
                        text: "michelle.rivera@example.com",
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 14,
                      ),

                      const SizedBox(height: 32),


                      CustomOtpField(
                        length: 6,
                        boxSize: 45.0,
                        onChanged: (value) {
                          print("OTP Value: $value");
                        },
                      ),





                      const SizedBox(height: 40),



                      CustomButton(
                        text: AppString.confirm,
                        onPressed: () {
                          Get.toNamed(Routes.SET_PASSWORD);
                        },
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