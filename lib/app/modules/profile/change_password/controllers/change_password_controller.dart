import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/data/services/auth_services.dart'; // আপনার AuthService-এর সঠিক পাথ দিন
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_dialog.dart';

class ChangePasswordController extends GetxController {
  final AuthServices _authServices = AuthServices();

  // টেক্সট কন্ট্রোলারসমূহ
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // লোডিং স্টেট
  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // পাসওয়ার্ড চেঞ্জ করার ফাংশন
  Future<void> changePassword(BuildContext context) async {
    final currentPassword = currentPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    // সাধারণ ভ্যালিডেশন
    if (currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "All fields are required", backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    if (newPassword.length < 6) {
      Get.snackbar("Error", "New password must be at least 6 characters", backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    if (newPassword != confirmPassword) {
      Get.snackbar("Error", "New passwords do not match", backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      isLoading.value = true;

      // ব্যাকএন্ডে এপিআই কল
      await _authServices.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      // সফল হলে ডায়ালগ দেখানো
      CustomDialog.show(
        context: context,
        title: "Success",
        message: 'Your password has been updated successfully.',
        confirmText: "OK",
        onConfirm: () {
          Get.back(); // ডায়ালগ বন্ধ হবে
          Get.back(); // আগের স্ক্রিনে ফিরে যাবে
        },
      );
    } catch (e) {
      Get.snackbar("Failed", e.toString().replaceAll("Exception: ", ""),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}