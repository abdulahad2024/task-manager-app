import 'package:flutter/foundation.dart'; // kDebugMode ব্যবহারের জন্য
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_snackbar.dart';
import 'package:task_masenger_app/app/data/local/local_auth_storage.dart';
import 'package:task_masenger_app/app/data/services/auth_services.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart'; // রাউট প্রয়োজন হলে ان-কমেন্ট করবেন

class VerifyCodeController extends GetxController {
  final AuthServices _authServices = AuthServices();

  String email = '';
  String otpCode = '';

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      email = Get.arguments;
      if (kDebugMode) {
        print("📧 [VerifyCodeController] Received Email from Arguments -> $email");
      }
    }
  }

  void onOtpChanged(String value) {
    otpCode = value;
    if (kDebugMode) {
      print("🔢 [VerifyCodeController] Current OTP Input -> $otpCode");
    }
  }

  Future<void> verifyEmail(BuildContext context) async {
    if (otpCode.length < 6) {
      if (kDebugMode) {
        print("⚠️ [VerifyCodeController] Validation Failed: OTP length is less than 6 digits.");
      }
      CustomSnackBar.show(
        context,
        title: "Opps!",
        message: "Please enter a valid 6-digit OTP code.",
        isError: true,
      );
      return;
    }

    try {
      isLoading.value = true;

      if (kDebugMode) {
        print("🚀 [VerifyCodeController] Sending Verify Email Request... Email: $email, Code: $otpCode");
      }

      // AuthServices থেকে verifyEmail মেথড কল করা হলো
      final response = await _authServices.verifyEmail(
        email: email,
        code: otpCode,
      );

      isLoading.value = false;

      if (kDebugMode) {
        print("✅ [VerifyCodeController] Email Verification Successful! Response -> $response");
      }

      // আপনার VerifyCodeController বা LoginController-এ:
      final storage = LocalAuthStorage();

// টোকেন ও ইউজার সেভ করা
      await storage.saveAccessToken(response['accessToken']);
      await storage.saveRefreshToken(response['refreshToken']);
      await storage.saveUserData(response['user']);

      // Success Message
      CustomSnackBar.show(
        context,
        title: "Success!",
        message: response['message'] ?? "Email verified successfully.",
        isError: false,
      );
      Get.toNamed(Routes.LOGIN);

    } catch (e) {
      isLoading.value = false;

      if (kDebugMode) {
        print("❌ [VerifyCodeController] Email Verification Error -> $e");
      }

      CustomSnackBar.show(
        context,
        title: "Opps!",
        message: e.toString().replaceAll("Exception: ", ""),
        isError: true,
      );
    }
  }
}