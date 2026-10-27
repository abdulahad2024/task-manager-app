import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text_feild.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

import '../controllers/verify_mail_controller.dart';

class VerifyMailView extends GetView<VerifyMailController> {
  const VerifyMailView({super.key});





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
                        text: AppString.verifyEmailTitle,
                        color: theme.textTheme.headlineMedium?.color,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 8),


                      CustomText(
                        text: AppString.verifyEmailSubtitle,
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 14,
                      ),

                      const SizedBox(height: 32),


                      CustomTextFromField(
                        label: AppString.emailAddress,
                        hint: AppString.hintEmail,
                        onChanged: (value) {
                          print(value);
                        },
                      ),



                      const SizedBox(height: 40),



                      CustomButton(
                        text: AppString.sendOtp,
                        onPressed: () {
                          Get.toNamed(Routes.VERIFY_CODE);
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