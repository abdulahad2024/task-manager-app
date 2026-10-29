import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/data/services/task_services.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_dialog.dart';
import 'package:task_masenger_app/app/modules/main/home/controllers/home_controller.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

class TaskDetailsController extends GetxController {
  final TaskServices _taskServices = TaskServices();

  // টাস্ক ডাটা সংরক্ষণ করার জন্য অবজারভেবল ম্যাপ বা ভেরিয়েবল
  final RxMap<String, dynamic> taskData = <String, dynamic>{}.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // আগের স্ক্রিন থেকে পাঠানো আর্গুমেন্ট (টাস্ক ডাটা) রিসিভ করা
    if (Get.arguments != null && Get.arguments is Map) {
      taskData.value = Map<String, dynamic>.from(Get.arguments);
    }
  }

  // টাস্ক ডিলিট করার ফাংশন
  Future<void> deleteTask(BuildContext context) async {
    final taskId = taskData['_id'] ?? taskData['id'];
    if (taskId == null) return;

    try {
      isLoading.value = true;

      // ব্যাকএন্ডে ডিলিট এপিআই কল
      await _taskServices.deleteTask(taskId);

      // সফল ডায়ালগ দেখানো
      CustomDialog.show(
        context: context,
        title: "Deleted",
        message: 'Your task has been deleted successfully.',
        confirmText: "OK",
        dialogType: DialogType.error,
        onConfirm: () {
          Get.back(); // ডায়ালগ বন্ধ হবে

          // 🌟 হোম কন্ট্রোলার মেমরিতে থাকলে ইনস্ট্যান্ট লিস্ট থেকে টাস্কটি রিমুভ করব অথবা ফেচ করব
          if (Get.isRegistered<HomeController>()) {
            final homeController = Get.find<HomeController>();

            // লিস্ট থেকে ডিলিট হওয়া টাস্কটি সরিয়ে দেওয়া (Optimistic Removal)
            homeController.taskList.removeWhere((task) => (task['_id'] ?? task['id']) == taskId);

            // অথবা ব্যাকআপ হিসেবে ফুল ফেচ কল করা যেতে পারে
            // homeController.fetchTasks();
          }

          // ডিটেইলস পেজ থেকে ব্যাক করে হোম বা প্রিভিয়াস পেজে যাওয়া এবং true রিটার্ন করা
          Get.back(result: true);
        },
      );
    } catch (e) {
      Get.snackbar("Failed", e.toString().replaceAll("Exception: ", ""),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  // এডিট পেজে যাওয়ার ফাংশন (টাস্ক ডাটা সহ)
  void goToEditTask() {
    Get.toNamed('${Routes.TASK}${Routes.EDIT_TASK}', arguments: taskData)?.then((result) {
      // এডিট হয়ে আসলে যদি result true হয়, তবে ডিটেইলসের ডাটা আপডেট করা যেতে পারে
      if (result == true) {
        // যদি এডিট পেজ থেকে আপডেটেড ডাটা পাস করা হয়, তা এখানে হ্যান্ডেল করতে পারেন
      }
    });
  }
}