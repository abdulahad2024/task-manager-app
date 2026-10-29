import 'package:get/get.dart';

import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/authentication/set_password/bindings/set_password_binding.dart';
import '../modules/authentication/set_password/views/set_password_view.dart';
import '../modules/authentication/verify_code/bindings/verify_code_binding.dart';
import '../modules/authentication/verify_code/views/verify_code_view.dart';
import '../modules/authentication/verify_mail/bindings/verify_mail_binding.dart';
import '../modules/authentication/verify_mail/views/verify_mail_view.dart';
import '../modules/main/bottom_nav/bindings/bottom_nav_binding.dart';
import '../modules/main/bottom_nav/views/bottom_nav_view.dart';
import '../modules/main/home/bindings/home_binding.dart';
import '../modules/main/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/change_password/bindings/change_password_binding.dart';
import '../modules/profile/change_password/views/change_password_view.dart';
import '../modules/profile/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/profile/edit_profile/views/edit_profile_view.dart';
import '../modules/profile/my_profile/bindings/my_profile_binding.dart';
import '../modules/profile/my_profile/views/my_profile_view.dart';
import '../modules/profile/profile/bindings/profile_binding.dart';
import '../modules/profile/profile/views/profile_view.dart';
import '../modules/settings/account_settings/bindings/account_settings_binding.dart';
import '../modules/settings/account_settings/views/account_settings_view.dart';
import '../modules/settings/help_center/bindings/help_center_binding.dart';
import '../modules/settings/help_center/views/help_center_view.dart';
import '../modules/settings/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/settings/privacy_policy/views/privacy_policy_view.dart';
import '../modules/settings/tearms_condition/bindings/tearms_condition_binding.dart';
import '../modules/settings/tearms_condition/views/tearms_condition_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/task/add_task/bindings/add_task_binding.dart';
import '../modules/task/add_task/views/add_task_view.dart';
import '../modules/task/edit_task/bindings/edit_task_binding.dart';
import '../modules/task/edit_task/views/edit_task_view.dart';
import '../modules/task/task/bindings/task_binding.dart';
import '../modules/task/task/views/task_view.dart';
import '../modules/task/task_details/bindings/task_details_binding.dart';
import '../modules/task/task_details/views/task_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_MAIL,
      page: () => const VerifyMailView(),
      binding: VerifyMailBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_CODE,
      page: () => const VerifyCodeView(),
      binding: VerifyCodeBinding(),
    ),
    GetPage(
      name: _Paths.SET_PASSWORD,
      page: () => const SetPasswordView(),
      binding: SetPasswordBinding(),
    ),

    // ── Profile সম্পর্কিত সকল রুট মেইন লিস্টে রাখা হলো ──
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => const MyProfileView(),
      binding: MyProfileBinding(),
    ),

    GetPage(
      name: _Paths.BOTTOM_NAV,
      page: () => const BottomNavView(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TASK,
      page: () => const AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => const TaskView(),
      binding: TaskBinding(),
      children: [
        GetPage(
          name: _Paths.EDIT_TASK,
          page: () => const EditTaskView(),
          binding: EditTaskBinding(),
        ),
        GetPage(
          name: _Paths.TASK_DETAILS,
          page: () => const TaskDetailsView(),
          binding: TaskDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.TEARMS_CONDITION,
      page: () => const TermsConditionView(),
      binding: TearmsConditionBinding(),
    ),
    GetPage(
      name: _Paths.HELP_CENTER,
      page: () => const HelpCenterView(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTINGS,
      page: () => const AccountSettingsView(),
      binding: AccountSettingsBinding(),
    ),
  ];
}