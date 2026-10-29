import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_snackbar.dart';
import 'package:task_masenger_app/app/data/services/auth_services.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final AuthServices _authServices = AuthServices();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Observable States
  final RxBool isRememberMe = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool isPasswordObscure = true.obs;
  final RxBool isConfirmPasswordObscure = true.obs;

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  // Toggle Confirm Password Visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value;
  }

  // Register Method
  Future<void> registerUser(BuildContext context) async {
    // Check Form Validation
    if (!registerFormKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      // Service Call (Node.js backend এর signup API হিট করা হচ্ছে)
      final response = await _authServices.signUp(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        address: addressController.text.trim(),
        password: passwordController.text.trim(),
      );

      isLoading.value = false;

      // Success Response using CustomSnackBar
      CustomSnackBar.show(
        context,
        title: "Success!",
        message: response['message'] ?? "Registration Successful! Please verify your email.",
        isError: false,
      );

      String registeredEmail = emailController.text.trim();

      clearControllers();

      Get.toNamed(Routes.VERIFY_CODE,arguments: registeredEmail);


    } catch (e) {
      isLoading.value = false;

      // Error Response using CustomSnackBar
      CustomSnackBar.show(
        context,
        title: "Opps!",
        message: e.toString().replaceAll("Exception: ", ""),
        isError: true,
      );
    }
  }

  // Clear Controllers Method
  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    addressController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}