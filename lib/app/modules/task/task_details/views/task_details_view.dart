import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_dialog.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_outline_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

import '../controllers/task_details_controller.dart';

class TaskDetailsView extends GetView<TaskDetailsController> {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
          text: 'Tasks Details',
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


              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Icon(Ionicons.document,
                            color: AppColor.primaryColor, size: 22),
                        const SizedBox(width: 10),
                        CustomText(
                          text: 'Task Title',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white70 : Colors.black54,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: CustomText(
                        text: 'Design Landing Page Header',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(color: Colors.black12, thickness: 1),
                    ),

                    Row(
                      children: [
                        Icon(Ionicons.newspaper,
                            color: AppColor.primaryColor, size: 22),
                        const SizedBox(width: 10),
                        CustomText(
                          text: 'Task Description',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white70 : Colors.black54,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: CustomText(
                        text:
                        'Create a clean, responsive header section for the landing page. Include logo, navigation menu, search bar, and a primary call-to-action button. Ensure mobile responsiveness and use the brand green.',
                        fontSize: 14,
                        color: isDark ? Colors.white60 : Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child: CustomOutlineButton(
                            label: 'Delete Task',
                            icon: Ionicons.trash,
                            borderColor: Colors.redAccent,
                            textColor: Colors.redAccent,
                            onTap: () {

                               CustomDialog.show(context: context,
                                    title: "Deleted",
                                    message: 'Your task has been Deleted successfully.',
                                    confirmText: "OK",
                                    dialogType: DialogType.error,
                                    cancelText: "Cancel",
                                   showCancelButton:true,
                                    onConfirm: () {});
                              }),
                                                      ),

                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomOutlineButton(
                            label: 'Edit Task',
                            icon: Ionicons.create,
                            borderColor: AppColor.primaryColor,
                            textColor: AppColor.primaryColor,
                            onTap: () {
                              Get.toNamed('${Routes.TASK}${Routes.EDIT_TASK}');

                            },
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}