import 'package:task_masenger_app/app/modules/authentication/login/controllers/login_controller.dart';
import 'package:task_masenger_app/app/modules/authentication/widgets/ordivider.dart';
import 'package:task_masenger_app/app/core/utils/validator/form_validator.dart';
import 'package:task_masenger_app/export.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                  child: Form(
                    key: controller.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),

                        CustomText(
                          text: AppString.loginTitle,
                          color: theme.textTheme.headlineMedium?.color,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 8),
                        CustomText(
                          text: AppString.loginSubtitle,
                          color: theme.textTheme.bodyMedium?.color,
                          fontSize: 14,
                        ),

                        const SizedBox(height: 32),

                        CustomTextFromField(
                          controller: controller.emailController,
                          label: AppString.emailAddress,
                          hint: AppString.hintEmail,
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidator.validateEmail,
                        ),

                        const SizedBox(height: 15),

                        Obx(
                              () => CustomTextFromField(
                            controller: controller.passwordController,
                            label: AppString.password,
                            hint: AppString.hintPassword,
                            isPassword: controller.isPasswordObscure.value,
                            keyboardType: TextInputType.visiblePassword,
                            validator: FormValidator.validatePassword,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Obx(
                              () => CustomCheckbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.isRememberMe.value,
                            onChanged: (newValue) {
                              controller.isRememberMe.value = newValue ?? false;
                            },
                            label: AppString.rememberMe,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Obx(
                              () => CustomButton(
                            text: AppString.loginButton,
                            isLoading: controller.isLoading.value,
                            onPressed: () {
                              controller.loginUser(context);
                            },
                          ),
                        ),

                        const SizedBox(height: 20),

                        const OrDivider(
                          text: AppString.or,
                        ),

                        const SizedBox(height: 20),

                        AuthActionText(
                          title: AppString.dontHaveAccount,
                          actionText: AppString.signupButton,
                          onTap: () {
                            Get.toNamed(Routes.REGISTER);
                          },
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