import 'package:task_masenger_app/app/modules/profile/widgets/profile_header.dart';
import 'package:task_masenger_app/app/modules/profile/widgets/profile_menu_list.dart';
import 'package:task_masenger_app/export.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Obx(() {
        if (controller.isLoading.value && controller.userData.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(
                theme: theme,
                imageUrl: controller.profileImageUrl, // 🌟 সরাসরি গেটার থেকে পাস করা হলো
                onTap: () {
                  print("🖼️ [Profile Image Clicked URL] -> ${controller.profileImageUrl}");
                },
              ),
              const SizedBox(height: 60),
              const ProfileMenuList(),
            ],
          ),
        );
      }),
    );
  }
}