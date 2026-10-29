import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_dialog.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text_feild.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {


    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Center(
            child: Card(
              shape: CircleBorder(),
              child: Material(
                color: AppColor.softColor,
                shape: const CircleBorder(
                  side: BorderSide(color: AppColor.primaryColor, width: 1.1),
                ),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    Get.back();
                  },
                  child: SizedBox(
                    width: 42,
                    height: 42,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 19,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        title: CustomText(
          text: 'Change Password',
          fontSize: theme.textTheme.titleLarge?.fontSize,
          fontWeight: FontWeight.w500,
        ),

        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextFromField(
                label: "Type Password",
                hint:  AppString.hintPassword,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: 15),

              CustomTextFromField(
                label: "New password",
                hint:  AppString.hintPassword,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: 15),

              CustomTextFromField(
                label: "New Confirm password",
                hint:  AppString.hintPassword,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: 20),

              CustomButton(
                text: "Update",
                onPressed: () {
                  CustomDialog.show(
                    context: context,
                    title: "Success",
                    message: 'Your password has been updated successfully.',
                    confirmText: "OK",
                    onConfirm: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
