import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_button.dart';
import 'package:task_masenger_app/app/common/widgets/common_widgets/custom_text_feild.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/modules/task/widgets/common_app_bar.dart';
import 'package:task_masenger_app/export.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const CommonAppBar(
        title: "Edit Profile",
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            children: [
              // প্রোফাইল পিকচার ও ক্যামেরা আইকন
// EditProfileView-এর ভেতরের CircleAvatar অংশটি এভাবে আপডেট করে দিন:

              Center(
                child: GestureDetector(
                  onTap: () => controller.showImageSourceDialog(context),
                  child: Stack(
                    children: [
                      Obx(() {
                        ImageProvider? imageProvider;

                        if (controller.selectedImage.value != null) {
                          // ১. যদি ইউজার নতুন ছবি গ্যালারি বা ক্যামেরা থেকে সিলেক্ট করে
                          imageProvider = FileImage(controller.selectedImage.value!);
                        } else if (controller.currentProfilePic.value.isNotEmpty) {
                          // ২. যদি সার্ভার থেকে আগের প্রোফাইল পিকচার লিংক আসে
                          String pic = controller.currentProfilePic.value;

                          // নিশ্চিত করুন AppConfig.domain এ http://192.168.0.105:5000 দেওয়া আছে
                          String fullUrl = pic.startsWith('http') ? pic : "${AppConfig.domain}$pic";

                          print("🖼️ [Loading Image URL] -> $fullUrl"); // ডিবাগ করার জন্য প্রিন্ট করে দেখতে পারেন

                          imageProvider = NetworkImage(fullUrl);
                        }

                        return CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColor.primaryColor.withValues(alpha: 0.2),
                          backgroundImage: imageProvider,
                          child: imageProvider == null
                              ? const Icon(Icons.person, size: 50, color: AppColor.primaryColor)
                              : null,
                        );
                      }),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.primaryColor, width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Ionicons.camera,
                            size: 16,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),              const SizedBox(height: 30),

              // প্রথম নাম ফিল্ড
              CustomTextFromField(
                controller: controller.firstNameController,
                label: AppString.firstName,
                hint: AppString.hintFirstName,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 15),

              // শেষ নাম ফিল্ড
              CustomTextFromField(
                controller: controller.lastNameController,
                label: AppString.lastName,
                hint: AppString.hintLastName,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 15),

              // ইমেইল ফিল্ড (সাধারণত ইমেইল এডিট করতে দেওয়া হয় না, তাই রিড-অনলি রাখা ভালো)
              CustomTextFromField(
                controller: controller.emailController,
                label: AppString.emailAddress,
                hint: AppString.hintEmail,
                keyboardType: TextInputType.emailAddress,
                readOnly: true, // চাইলে ফলস করে দিতে পারেন
              ),
              const SizedBox(height: 15),

              // এড্রেস ফিল্ড
              CustomTextFromField(
                controller: controller.addressController,
                label: AppString.address,
                hint: AppString.hintAddress,
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 30),

              // আপডেট বাটন
              CustomButton(
                text: controller.isUpdating.value ? "Updating..." : "Update",
                onPressed: controller.isUpdating.value
                    ? () {}
                    : () => controller.updateProfile(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }
}