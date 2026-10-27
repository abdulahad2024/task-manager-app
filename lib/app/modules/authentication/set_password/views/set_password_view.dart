import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text_feild.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/modules/authentication/widgets/auth_action_text.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

import '../controllers/set_password_controller.dart';

class SetPasswordView extends GetView<SetPasswordController> {
  const SetPasswordView({super.key});
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
                        text: AppString.setNewPasswordTitle,
                        color: theme.textTheme.headlineMedium?.color,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 8),
                      CustomText(
                        text: AppString.setNewPasswordSubtitle,
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 14,
                      ),

                      const SizedBox(height: 32),


                      CustomTextFromField(
                        label: AppString.newPassword,
                        hint: AppString.hintPassword,
                        isPassword: true,
                        onChanged: (value) {
                          print(value);
                        },
                      ),

                      const SizedBox(height: 12),

                      CustomTextFromField(
                        label: AppString.newConfirmPassword,
                        hint: AppString.hintPassword,
                        isPassword: true,
                        onChanged: (value) {
                          print(value);
                        },
                      ),

                      const SizedBox(height: 12),

                      const SizedBox(height: 20),


                      const SizedBox(height: 15),

                      CustomButton(
                        text: AppString.continueText,
                        onPressed: () {
                          Get.toNamed(Routes.BOTTOM_NAV);
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
