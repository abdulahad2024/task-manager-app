import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/data/services/task_services.dart'; // আপনার TaskServices পাথ দিন
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_dialog.dart';

class EditTaskController extends GetxController {
  final TaskServices _taskServices = TaskServices();

  // টেক্সট কন্ট্রোলারসমূহ
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // টাস্ক আইডি (যা আগের স্ক্রিন থেকে পাস হয়ে আসবে)
  late String taskId;

  // লোডিং স্টেট
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // আর্গুমেন্ট থেকে টাস্ক ডাটা রিসিভ করা (যদি Map আকারে পাঠানো হয়)
    if (Get.arguments != null && Get.arguments is Map) {
      final taskData = Get.arguments as Map<String, dynamic>;
      taskId = taskData['_id'] ?? taskData['id'] ?? '';
      titleController.text = taskData['title'] ?? '';
      descriptionController.text = taskData['description'] ?? '';
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // টাস্ক আপডেট করার ফাংশন
  Future<void> updateTask(BuildContext context) async {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      Get.snackbar("Error", "All fields are required",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      isLoading.value = true;

      // ব্যাকএন্ডে আপডেট এপিআই কল
      await _taskServices.updateTask(
        taskId: taskId,
        updatedFields: {
          "title": title,
          "description": description,
        },
      );

      // সফল হলে ডায়ালগ দেখানো
      CustomDialog.show(
        context: context,
        title: "Success",
        message: 'Your task has been updated successfully.',
        confirmText: "OK",
        onConfirm: () {
          Get.back(); // ডায়ালগ বন্ধ হবে
          Get.back(result: true); // আগের স্ক্রিনে ফিরে যাবে এবং রিফ্রেশের জন্য true পাঠাবে
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