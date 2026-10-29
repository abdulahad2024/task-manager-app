import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text_feild.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';

import '../controllers/edit_task_controller.dart';

class EditTaskView extends GetView<EditTaskController> {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    // কন্ট্রোলার ইনিশিয়ালাইজ করা
    final controller = Get.put(EditTaskController());
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
                    Get.back();
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
          text: 'Edit Task',
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
                // টাস্ক টাইটেল ফিল্ড (আগের ডাটা সহ)
                CustomTextFromField(
                  controller: controller.titleController,
                  label: "Task Title",
                  hint: "e.g. Design Landing Page Header",
                ),
          
                const SizedBox(height: 15),
          
                // ডেসক্রিপশন ফিল্ড (আগের ডাটা সহ)
                CustomTextFromField(
                  controller: controller.descriptionController,
                  label: "Description",
                  hint: "e.g. Include logo, navigation, and CTA button with brand color",
                  maxLines: 3,
                ),
          
                const SizedBox(height: 20),
          
                // আপডেট বাটন (Obx দিয়ে লোডিং হ্যান্ডেল করা হয়েছে)
                Obx(() => CustomButton(
                  text:  "Update Task",
                  isLoading: controller.isLoading.value,
                  onPressed: ()=> controller.updateTask(context),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}