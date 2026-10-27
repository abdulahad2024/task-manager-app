import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text_feild.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/modules/main/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {

    final BottomNavController bottomNavController = Get.put(BottomNavController());
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
              shape: CircleBorder(),
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
                  child: SizedBox(
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextFromField(
                label: "Task Title",
                hint: "e.g. Design Landing Page Header",
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: 15),

              CustomTextFromField(
                label: "Description",
                hint: "e.g. Include logo, navigation, and CTA button with brand color",
                maxLines: 3,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: 20),

              CustomButton(text: "Save Task", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
