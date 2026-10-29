import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/data/local/local_auth_storage.dart';
import 'package:task_masenger_app/app/data/services/auth_services.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

class AccountSettingsController extends GetxController {
  final AuthServices _authServices = AuthServices();
  final LocalAuthStorage _storage = LocalAuthStorage();

  // অ্যাকাউন্ট ডিলিট করার মডার্ন কনফার্মেশন ডায়ালগ
  void showDeleteConfirmationDialog(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ওয়ার্নিং আইকন
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Ionicons.warning,
                  color: Colors.redAccent,
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),

              // টাইটেল
              Text(
                "Delete Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              // সাবটাইটেল বা মেসেজ
              Text(
                "Are you sure you want to delete your account? All your tasks and data will be permanently removed. This action cannot be undone.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
              const SizedBox(height: 24),

              // বাটনগুলো (Cancel & Delete)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.grey.withValues(alpha: 0.4)),
                      ),
                      onPressed: () => Get.back(),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Get.back(); // ডায়ালগ বন্ধ করা
                        executeDeleteAccount(); // ডিলিট প্রসেস কল করা
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // একাউন্ট ডিলিট ব্যাকএন্ড প্রসেস
  Future<void> executeDeleteAccount() async {
    try {
      // লোডিং ডায়ালগ
      Get.dialog(
        const Center(child: CircularProgressIndicator(
          color: AppColor.primaryColor,
        )),
        barrierDismissible: false,
      );

      await _authServices.deleteAccount();
      await _storage.clearAuthData();

      if (Get.isDialogOpen ?? false) Get.back();

      Get.offAllNamed(Routes.LOGIN);

      Get.snackbar(
        "Success",
        "Your account has been deleted successfully.",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();
      Get.snackbar(
        "Failed",
        e.toString().replaceAll("Exception: ", ""),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}