import '../../widgets/ordivider.dart';
import '../controllers/register_controller.dart';
import 'package:task_masenger_app/export.dart';
import 'package:task_masenger_app/app/core/utils/validator/form_validator.dart'; // আপনার প্রজেক্ট অনুযায়ী পাথ চেক করে নিবেন

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
                  minHeight: constraints.maxHeight - 40,
                ),
                child: Center(
                  child: Form(
                    key: controller.registerFormKey, // Form Key যুক্ত করা হলো
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),

                        CustomText(
                          text: AppString.signupTitle,
                          color: theme.textTheme.headlineMedium?.color,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 8),
                        CustomText(
                          text: AppString.signupSubtitle,
                          color: theme.textTheme.bodyMedium?.color,
                          fontSize: 14,
                        ),

                        const SizedBox(height: 28),

                        // First Name Field
                        CustomTextFromField(
                          controller: controller.firstNameController,
                          label: AppString.firstName,
                          hint: AppString.hintFirstName,
                          keyboardType: TextInputType.name,
                          validator: (value) => FormValidator.validateName(value, 'First name'),
                        ),

                        const SizedBox(height: 15),

                        // Last Name Field
                        CustomTextFromField(
                          controller: controller.lastNameController,
                          label: AppString.lastName,
                          hint: AppString.hintLastName,
                          keyboardType: TextInputType.name,
                          validator: (value) => FormValidator.validateName(value, 'Last name'),
                        ),

                        const SizedBox(height: 15),

                        // Email Field
                        CustomTextFromField(
                          controller: controller.emailController,
                          label: AppString.emailAddress,
                          hint: AppString.hintEmail,
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidator.validateEmail,
                        ),

                        const SizedBox(height: 15),

                        // Address Field
                        CustomTextFromField(
                          controller: controller.addressController,
                          label: AppString.address,
                          hint: AppString.hintAddress,
                          keyboardType: TextInputType.streetAddress,
                          validator: FormValidator.validateAddress,
                        ),

                        const SizedBox(height: 15),

                        // Password Field
                        Obx(() => CustomTextFromField(
                          controller: controller.passwordController,
                          label: AppString.password,
                          hint: AppString.hintPassword,
                          isPassword: controller.isPasswordObscure.value,
                          keyboardType: TextInputType.visiblePassword,
                          validator: FormValidator.validatePassword,
                          // suffixIcon দিয়ে পাসওয়ার্ড ভিজিবিলিটি টগল যোগ করতে পারেন যদি উইজেটে অপশন থাকে
                        )),

                        const SizedBox(height: 15),

                        // Confirm Password Field
                        Obx(() => CustomTextFromField(
                          controller: controller.confirmPasswordController,
                          label: AppString.confirmPassword,
                          hint: AppString.hintPassword,
                          isPassword: controller.isConfirmPasswordObscure.value,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) => FormValidator.validateConfirmPassword(
                            value,
                            controller.passwordController.text,
                          ),
                        )),

                        const SizedBox(height: 12),

                        // Terms & Conditions Checkbox
                        Obx(
                              () => CustomCheckbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.isRememberMe.value,
                            onChanged: (newValue) {
                              controller.isRememberMe.value = newValue ?? false;
                            },
                            label: AppString.termsAgreement,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const OrDivider(text: AppString.or),

                        const SizedBox(height: 15),

                        // Already have an account? Login
                        AuthActionText(
                          title: AppString.alreadyHaveAccount,
                          actionText: AppString.loginButton,
                          onTap: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                        ),
                        const SizedBox(height: 15),

                        // Register / Continue Button with Loading State
                        Obx(
                              () =>  CustomButton(
                            text: AppString.continueText,
                            isLoading: controller.isLoading.value,
                            onPressed: () {
                              controller.registerUser(context);
                            },
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
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