

import '../../widgets/ordivider.dart';
import '../controllers/register_controller.dart';
import 'package:task_masenger_app/export.dart';

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

                      CustomTextFromField(
                        label: AppString.firstName,
                        hint: AppString.hintFirstName,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {},
                      ),

                      const SizedBox(height: 15),

                      CustomTextFromField(
                        label: AppString.lastName,
                        hint: AppString.hintLastName,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {},
                      ),

                      const SizedBox(height: 15),

                      CustomTextFromField(
                        label: AppString.emailAddress,
                        hint: AppString.hintEmail,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {},
                      ),

                      const SizedBox(height: 15),

                      CustomTextFromField(
                        label: AppString.address,
                        hint: AppString.hintAddress,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (value) {},
                      ),

                      const SizedBox(height: 15),

                      CustomTextFromField(
                        label: AppString.password,
                        hint: AppString.hintPassword,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {},
                      ),

                      const SizedBox(height: 15),

                      CustomTextFromField(
                        keyboardType: TextInputType.visiblePassword,
                        label: AppString.confirmPassword,
                        hint: AppString.hintPassword,
                        isPassword: true,
                        onChanged: (value) {},
                      ),

                      const SizedBox(height: 12),

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

                      AuthActionText(
                        title: AppString.alreadyHaveAccount,
                        actionText: AppString.loginButton,
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                      ),
                      const SizedBox(height: 15),

                      CustomButton(
                        text: AppString.continueText,
                        onPressed: () {
                          Get.toNamed(Routes.VERIFY_MAIL);
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
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
