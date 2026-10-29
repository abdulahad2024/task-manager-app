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
    String? rememberedEmail = _storage.getRememberedEmail();
    if (rememberedEmail != null && rememberedEmail.isNotEmpty) {
      emailController.text = rememberedEmail;
      isRememberMe.value = true;
    }
  }

  // Password Visibility Toggle Method
  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  // Login API Call
  Future<void> loginUser(BuildContext context) async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      if (kDebugMode) {
        print("🚀 [LoginController] Sending Login Request... Email: ${emailController.text.trim()}");
      }

      final response = await _authServices.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      isLoading.value = false;

      if (kDebugMode) {
        print("✅ [LoginController] Login Successful! Response -> $response");
      }

      await _storage.saveAccessToken(response['accessToken'] ?? '');
      if (response['refreshToken'] != null) {
        await _storage.saveRefreshToken(response['refreshToken']);
      }
      if (response['user'] != null) {
        await _storage.saveUserData(response['user']);
      }

      if (isRememberMe.value) {
        _storage.saveRememberedEmail(emailController.text.trim());
      } else {
        _storage.clearRememberedEmail();
      }

      CustomSnackBar.show(
        context,
        title: "Success!",
        message: response['message'] ?? "Login successful.",
        isError: false,
      );

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