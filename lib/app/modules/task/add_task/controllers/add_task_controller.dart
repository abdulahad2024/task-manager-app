import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/data/services/task_services.dart'; // আপনার TaskServices-এর সঠিক পাথ দিন
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_dialog.dart';
import 'package:task_masenger_app/app/modules/main/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:task_masenger_app/app/modules/main/home/controllers/home_controller.dart';

class AddTaskController extends GetxController {
  final TaskServices _taskServices = TaskServices();

  // টেক্সট কন্ট্রোলারসমূহ
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // লোডিং স্টেট
  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // টাস্ক সেভ করার ফাংশন
  Future<void> createTask(BuildContext context) async {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    // সাধারণ ভ্যালিডেশন
    if (title.isEmpty) {
      Get.snackbar("Error", "Task title cannot be empty",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    if (description.isEmpty) {
      Get.snackbar("Error", "Task description cannot be empty",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      isLoading.value = true;

      // 🌟 ব্যাকএন্ডে টাস্ক ক্রিয়েট এপিআই কল এবং রেসপন্স স্টোর করা
      final response = await _taskServices.createTask(
        title: title,
        description: description,
        status: 'pending', // ডিফল্ট স্ট্যাটাস
      );

      // সফল হলে ডায়ালগ বা সাকসেস মেসেজ দেখানো
      CustomDialog.show(
        context: context,
        title: "Success",
        message: 'Task has been created successfully.',
        confirmText: "OK",
        onConfirm: () {
          Get.back(); // ডায়ালগ বন্ধ হবে

          // ফর্ম রিসেট করা
          titleController.clear();
          descriptionController.clear();

          // 🌟 অত্যন্ত গুরুত্বপূর্ণ: হোম কন্ট্রোলার মেমরিতে থাকলে নতুন টাস্কটি ইনস্ট্যান্ট লিস্টে এড হবে
          if (Get.isRegistered<HomeController>()) {
            final homeController = Get.find<HomeController>();

            // যদি ব্যাকএন্ড থেকে নতুন টাস্কের ডাটা ব্যাক আসে, সেটি লিস্টে ইনসার্ট করব
            if (response != null && response['data'] != null) {
              homeController.taskList.insert(0, response['data']); // সবার উপরে দেখানোর জন্য insert
            } else {
              homeController.fetchTasks(); // যদি ডাটা না থাকে তবে ফুল ফেচ করবে
            }
          }

          // 🌟 প্রিভিয়াস পেজে ফিরে যাওয়ার সময় result: true পাঠানো হলো, যাতে হোমে ডাটা রিফ্রেশ হয়
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
}