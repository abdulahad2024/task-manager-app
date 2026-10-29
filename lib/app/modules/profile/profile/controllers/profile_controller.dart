import 'package:flutter/foundation.dart';
import 'package:task_masenger_app/app/data/services/user_services.dart';
import 'package:task_masenger_app/export.dart';

class ProfileController extends GetxController {
  final UserServices _userServices = UserServices();

  final RxBool isLoading = false.obs;
  final RxMap<String, dynamic> userData = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    try {
      isLoading.value = true;
      final response = await _userServices.getProfile();
      if (response != null && response['data'] != null) {
        userData.value = Map<String, dynamic>.from(response['data']);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // 🌟 এই গেটারটি একদম নিরাপদভাবে ফুল ইমেজ ইউআরএল তৈরি করে দেবে
  String get profileImageUrl {
    final pic = userData['profilePicture']?.toString();
    if (pic == null || pic.trim().isEmpty || pic == "null") {
      return '';
    }
    if (pic.startsWith('http://') || pic.startsWith('https://')) {
      return pic;
    }

    // ডোমেইন এবং পাথের মাঝের স্লাশ হ্যান্ডেল করার জন্য
    final cleanDomain = AppConfig.domain.endsWith('/')
        ? AppConfig.domain.substring(0, AppConfig.domain.length - 1)
        : AppConfig.domain;

    final cleanPath = pic.startsWith('/') ? pic : '/$pic';

    final finalUrl = '$cleanDomain$cleanPath';
    print("🖼️ [Final Profile Image URL] -> $finalUrl");
    return finalUrl;
  }
}