import 'package:task_masenger_app/export.dart'; // অথবা আপনার AppConfig-এর সঠিক ইমপোর্ট পাথ

class ApiEndpoints {
  // Base URL (এখানে /api/v1 পর্যন্ত থাকবে)
  static const String baseUrl = "${AppConfig.domain}/api/v1";

  // ==================== AUTH MODULE ====================
  // শুধুমাত্র শেষের অংশটুকু থাকবে, কোনো ডোমেইন বা /api/v1 আবার বসবে না
  static const String signUp = "/auth/signup";
  static const String verifyEmail = "/auth/verify-email";
  static const String login = "/auth/login";
  static const String editProfile = "/auth/edit-profile";
  static const String profile = "/auth/profile";
  static const String deleteAccount = "/auth/delete";
  static const String changePassword = "/auth/change-password";
  static const String resentPassword = "/auth/resent-password";

  // ==================== TASK MODULE ====================
  static const String addTask = "/task/add";
  static const String getTask = "/task/get";
  static const String updateTask = "/task/update";
  static const String deleteTask = "/task/delete";
}