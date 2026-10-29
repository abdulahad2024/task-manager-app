import 'package:task_masenger_app/export.dart';

class ApiEndpoints {
  // Base URL (এখানে /api/v1 পর্যন্ত থাকবে)
  static const String baseUrl = "${AppConfig.domain}/api/v1";

  // ==================== AUTH MODULE ====================
  static const String signUp = "/auth/signup";
  static const String verifyEmail = "/auth/verify-email";
  static const String login = "/auth/login";

  // প্রোফাইল ফেচ (GET) করার জন্য
  static const String profile = "/users/me";

  // প্রোফাইল আপডেট বা ছবি আপলোড (PATCH / Multipart) করার জন্য সঠিক রুটটি এখানে দিন
  static const String editProfile = "/users/me"; // ব্যাকএন্ডের রুট অনুযায়ী পরিবর্তন করুন

  static const String deleteAccount = "/users/me";
  static const String changePassword = "/auth/change-password";
  static const String resentPassword = "/auth/resent-password";

  // ==================== TASK MODULE ====================
  static const String addTask = "/task/add";
  static const String getTask = "/task/get";
  static const String updateTask = "/task/update";
  static const String deleteTask = "/task/delete";


  static const String tasks = "/tasks"; // বেইজ টাস্ক রুট (POST / GET এর জন্য)
}