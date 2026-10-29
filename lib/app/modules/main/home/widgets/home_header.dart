import 'package:task_masenger_app/app/modules/profile/profile/controllers/profile_controller.dart';
import 'package:task_masenger_app/export.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final ProfileController profileController = Get.isRegistered<ProfileController>()
        ? Get.find<ProfileController>()
        : Get.put(ProfileController());

    return Obx(() {
      String pic = profileController.userData['profilePicture']?.toString() ?? '';
      String fullImageUrl = '';
      if (pic.isNotEmpty && pic != "null") {
        if (pic.startsWith('http://') || pic.startsWith('https://')) {
          fullImageUrl = pic;
        } else {
          final cleanDomain = AppConfig.domain.endsWith('/')
              ? AppConfig.domain.substring(0, AppConfig.domain.length - 1)
              : AppConfig.domain;
          final cleanPath = pic.startsWith('/') ? pic : '/$pic';
          fullImageUrl = '$cleanDomain$cleanPath';
        }
      }

      // ২. ডাইনামিক নাম তৈরি (firstName বা fullName থাকলে তা দেখাবে)
      String firstName = profileController.userData['firstName']?.toString() ?? 'User';
      String displayName = "Hello $firstName";

      return Row(
        children: [
          // ডাইনামিক সার্কেল অবতার ও নেটওয়ার্ক ইমেজ
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColor.primaryColor.withValues(alpha: 0.2),
            backgroundImage: fullImageUrl.isNotEmpty
                ? NetworkImage(fullImageUrl) as ImageProvider
                : const AssetImage('assets/images/default_avatar.png') as ImageProvider, // কোনো ছবি না থাকলে লোকাল ডিফল্ট ইমেজ দিতে পারেন
            child: fullImageUrl.isEmpty
                ? const Icon(Icons.person, color: AppColor.primaryColor)
                : null,
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ডাইনামিক ইউজারের নাম
              CustomText(
                text: displayName,
                fontSize: theme.textTheme.titleMedium?.fontSize,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 2),
              const CustomText(
                text: "Welcome to Task Manager",
                fontSize: 12, // বা theme.textTheme.titleSmall?.fontSize
              ),
            ],
          ),
        ],
      );
    });
  }
}