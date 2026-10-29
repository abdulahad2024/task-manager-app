import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text_feild.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/modules/main/bottom_nav/controllers/bottom_nav_controller.dart';
import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddTaskController());

    final BottomNavController bottomNavController = Get.isRegistered<BottomNavController>()
        ? Get.find<BottomNavController>()
        : Get.put(BottomNavController());

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Center(
            child: Card(
              shape: const CircleBorder(),
              child: Material(
                color: AppColor.softColor,
                shape: const CircleBorder(
                  side: BorderSide(color: AppColor.primaryColor, width: 1.1),
                ),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    bottomNavController.goToHome();
                  },
                  child: const SizedBox(
                    width: 42,
                    height: 42,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 19,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        title: CustomText(
          text: 'Add Task',
          fontSize: theme.textTheme.titleLarge?.fontSize,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // টাস্ক টাইটেল ফিল্ড
                CustomTextFromField(
                  controller: controller.titleController, // 🌟 কন্ট্রোলার যুক্ত করা হলো
                  label: "Task Title",
                  hint: "e.g. Design Landing Page Header",
                ),
          
                const SizedBox(height: 15),
          
                // ডেসক্রিপশন ফিল্ড
                CustomTextFromField(
                  controller: controller.descriptionController, // 🌟 কন্ট্রোলার যুক্ত করা হলো
                  label: "Description",
                  hint: "e.g. Include logo, navigation, and CTA button with brand color",
                  maxLines: 3,
                ),
          
                const SizedBox(height: 20),
          
                // সেভ বাটন (Obx দিয়ে লোডিং হ্যান্ডেল করা হয়েছে)
                Obx(() => CustomButton(
                  text:  "Save Task",
                  isLoading: controller.isLoading.value,
                  onPressed: () => controller.createTask(context),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}