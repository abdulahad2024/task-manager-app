import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_masenger_app/app/data/services/user_services.dart';
import 'package:task_masenger_app/export.dart';

class EditProfileController extends GetxController {
  final UserServices _userServices = UserServices();

  // টেক্সট কন্ট্রোলারসমূহ
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController addressController;

  // রিয়্যাক্টিভ ভেরিয়েবলস
  final RxBool isLoading = false.obs;
  final RxBool isUpdating = false.obs;

  // সিলেক্ট করা ইমেজ ফাইল রাখার জন্য
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxString currentProfilePic = ''.obs;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();

    // পেজ ওপেন হওয়ার সাথে সাথে ইউজারের কারেন্ট ডেটা লোড করা
    loadUserProfileData();
  }

  // আগের ডেটা ফর্মের ফিল্ডগুলোতে বসানোর জন্য
  void loadUserProfileData() async {
    try {
      isLoading.value = true;
      final response = await _userServices.getProfile();
      if (response != null && response['data'] != null) {
        final userData = response['data'];
        firstNameController.text = userData['firstName'] ?? '';
        lastNameController.text = userData['lastName'] ?? '';
        emailController.text = userData['email'] ?? '';
        addressController.text = userData['address'] ?? '';
        currentProfilePic.value = userData['profilePicture'] ?? '';
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load profile data: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  // ক্যামেরা বা গ্যালারি থেকে ছবি সিলেক্ট করার ফাংশন
  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );
      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image: $e");
    }
  }

  // ইমেজ সিলেক্ট করার জন্য বটম শিট (Camera / Gallery অপশন)
  void showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // প্রোফাইল আপডেট এবং ছবি আপলোড করার ফাংশন
  Future<void> updateProfile() async {
    try {
      isUpdating.value = true;

      // ১. যদি নতুন ছবি সিলেক্ট করা থাকে তবে আগে মাল্টিপার্ট দিয়ে ছবি আপলোড করা
      if (selectedImage.value != null) {
        await _userServices.updateProfilePicture(
          imageFile: selectedImage.value!,
          imageFieldKey: 'profilePicture', // ব্যাকএন্ডের ফিল্ড নেম অনুযায়ী দিন
        );
      }

      // ২. টেক্সট ডেটা আপডেট করা (নাম, এড্রেস ইত্যাদি)
      Map<String, dynamic> updateData = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "address": addressController.text.trim(),
      };

      await _userServices.updateProfile(updateData: updateData);

      Get.snackbar(
        "Success",
        "Profile updated successfully!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // সফলভাবে আপডেট হওয়ার পর ব্যাকে চলে যাওয়া
      Get.back(result: true);

    } catch (e) {
      Get.snackbar(
        "Error",
        "Update failed: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isUpdating.value = false;
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.onClose();
  }
}