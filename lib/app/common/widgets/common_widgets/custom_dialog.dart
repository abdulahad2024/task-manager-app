import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../core/constants/color/app_color.dart';
import 'custom_button.dart';
import 'custom_text.dart';

enum DialogType { success, warning, error }

class CustomDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    required String confirmText,
    required VoidCallback onConfirm,
    DialogType dialogType = DialogType.success,
    String cancelText = 'Cancel',
    bool showCancelButton = false,
    VoidCallback? onCancel,
  }) {
    IconData iconData;
    Color iconColor;
    Color buttonColor;

    switch (dialogType) {
      case DialogType.success:
        iconData = Ionicons.checkmarkCircle;
        iconColor = AppColor.primaryColor;
        buttonColor = AppColor.primaryColor;
        break;
      case DialogType.warning:
        iconData = Icons.warning_amber_rounded;
        iconColor = AppColor.warningColor;
        buttonColor = AppColor.primaryColor;
        break;
      case DialogType.error:
        iconData = Icons.error_outline_rounded;
        iconColor = AppColor.errorColor;
        buttonColor = AppColor.primaryColor;
        break;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
        title: Column(
          children: [
            Icon(
              iconData,
              size: 56,
              color: iconColor,
            ),
            const SizedBox(height: 12),
            CustomText(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
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
          Row(
            children: [
              // Cancel Button (আউটলাইন স্টাইল)
              if (showCancelButton) ...[
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (onCancel != null) onCancel();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColor.primaryColor, width: 1.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: CustomText(
                        text: cancelText,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],

              // Confirm Button
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: CustomButton(
                    text: confirmText,
                    backgroundColor: buttonColor,
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}