import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../core/constants/color/app_color.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    required String confirmText,
    required VoidCallback onConfirm,
    bool isError = false,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Column(
          children: [
            Icon(
              isError ? Icons.warning_amber_rounded : Ionicons.checkmark,
              size: 48,
              color: isError ? AppColor.errorColor : AppColor.warningColor,
            ),
            const SizedBox(height: 10),
            CustomText(text: title, fontSize: 20, fontWeight: FontWeight.bold),
          ],
        ),
        content: CustomText(
          text: message,
          fontSize: 14,
          textAlign: TextAlign.center,
          color: AppColor.secondaryTextColor,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          // TextButton(
          //   onPressed: () => Navigator.pop(context),
          //   child: const CustomText(text: 'Cancel', color: AppColor.secondaryTextColor),
          // ),
          SizedBox(
            width: 120,
            height: 40,
            child: CustomButton(
              text: confirmText,
              backgroundColor: isError ? AppColor.errorColor : AppColor.primaryColor,
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
            ),
          ),
        ],
      ),
    );
  }
}