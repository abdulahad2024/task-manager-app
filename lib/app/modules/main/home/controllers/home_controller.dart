import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/data/services/task_services.dart';

class HomeController extends GetxController {
  final TaskServices _taskServices = TaskServices();

  final RxList<dynamic> taskList = <dynamic>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  // 🌟 অত্যন্ত গুরুত্বপূর্ণ: হোম স্ক্রিন বা ট্যাব ফোকাস পেলেই এটি রান হবে এবং সাথে সাথে ডাটা নিয়ে আসবে
  @override
  void onReady() {
    super.onReady();
    fetchTasks();
  }

  // সার্ভার থেকে সব টাস্ক ফেচ করার ফাংশন
  Future<void> fetchTasks() async {
    try {
      // যদি লিস্ট অলরেডি খালি থাকে তবেই লোডিং দেখাবো, অন্যথায় ব্যাকগ্রাউন্ডে সাইলেন্টলি রিফ্রেশ হবে
      if (taskList.isEmpty) {
        isLoading.value = true;
      }

      final response = await _taskServices.getTasks();

      if (response != null && response['data'] != null) {
        taskList.value = List<dynamic>.from(response['data']);
      } else {
        taskList.clear();
      }
    } catch (e) {
      if (kDebugMode) print("❌ Error fetching tasks: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // পুল-টু-রিফ্রেশ করার জন্য
  Future<void> onRefresh() async {
    await fetchTasks();
  }
}