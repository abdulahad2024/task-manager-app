import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_header.dart';
import '../widgets/home_task_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // কন্ট্রোলার ইনিশিয়ালাইজ করা নিশ্চিত করুন
    final controller = Get.put(HomeController());
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: 24),

              CustomText(
                text: "My Tasks",
                fontSize: theme.textTheme.titleLarge?.fontSize,
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 10),

              // Obx দিয়ে র‍্যাপ করা যাতে টাস্ক লিস্ট আপডেট হলে অটো রেন্ডার হয়
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value && controller.taskList.isEmpty) {
                    return const Center(child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ));
                  }

                  if (controller.taskList.isEmpty) {
                    return Center(
                      child: CustomText(
                        text: "No tasks found. Add a new task!",
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    );
                  }

                  return RefreshIndicator(
                    color: AppColor.primaryColor,
                    onRefresh: controller.onRefresh,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemCount: controller.taskList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final task = controller.taskList[index];

                        return HomeTaskCard(
                          title: task['title'] ?? 'No Title',
                          subtitle: task['description'] ?? 'No Description',
                          onTap: () {
                            // 🌟 নির্দিষ্ট টাস্কের ডাটা আর্গুমেন্ট হিসেবে পাস করে ডিটেইলস পেজে যাওয়া
                            Get.toNamed(
                              '${Routes.TASK}${Routes.TASK_DETAILS}',
                              arguments: task,
                            )?.then((result) {
                              // ডিটেইলস পেজ থেকে ডিলিট বা এডিট হয়ে আসলে লিস্ট রিফ্রেশ করা
                              if (result == true) {
                                controller.fetchTasks();
                              }
                            });
                          },
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}