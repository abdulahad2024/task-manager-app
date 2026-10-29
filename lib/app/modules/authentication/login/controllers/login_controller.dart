import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_snackbar.dart';
import 'package:task_masenger_app/app/core/utils/validator/form_validator.dart';
import 'package:task_masenger_app/app/data/local/local_auth_storage.dart';
import 'package:task_masenger_app/app/data/services/auth_services.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthServices _authServices = AuthServices();
  final LocalAuthStorage _storage = LocalAuthStorage();

  // Form Key
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Checkbox State
  final RxBool isRememberMe = false.obs;

  // Password Visibility Toggle
  final RxBool isPasswordObscure = true.obs;

  // Loading State
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // যদি আগে Remember Me করা থাকে, তবে সেভ করা ইমেইলটি ফিল্ডে বসিয়ে দেওয়া যেতে পারে
    String? rememberedEmail = _storage.getRememberedEmail();
    if (rememberedEmail != null && rememberedEmail.isNotEmpty) {
      emailController.text = rememberedEmail;
      isRememberMe.value = true;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Login API Call
  Future<void> loginUser(BuildContext context) async {
    // ফর্ম ভ্যালিডেশন চেক
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      if (kDebugMode) {
        print("🚀 [LoginController] Sending Login Request... Email: ${emailController.text.trim()}");
      }

      // AuthServices থেকে login মেথড কল করা
      final response = await _authServices.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      isLoading.value = false;

      if (kDebugMode) {
        print("✅ [LoginController] Login Successful! Response -> $response");
      }

      // টোকেন এবং ইউজার ডেটা লোকাল স্টোরেজে সেভ করা
      await _storage.saveAccessToken(response['accessToken'] ?? '');
      if (response['refreshToken'] != null) {
        await _storage.saveRefreshToken(response['refreshToken']);
      }
      if (response['user'] != null) {
        await _storage.saveUserData(response['user']);
      }

      // Remember Me চেক করা থাকলে ইমেইল সেভ করে রাখা
      if (isRememberMe.value) {
        _storage.saveRememberedEmail(emailController.text.trim());
      } else {
        _storage.clearRememberedEmail();
      }

      // Success Message
      CustomSnackBar.show(
        context,
        title: "Success!",
        message: response['message'] ?? "Login successful.",
        isError: false,
      );

      // ড্যাশবোর্ড বা হোম পেজে রিডাইরেক্ট করা
      Get.offAllNamed(Routes.BOTTOM_NAV);

    } catch (e) {
      isLoading.value = false;

      if (kDebugMode) {
        print("❌ [LoginController] Login Error -> $e");
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