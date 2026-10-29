import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_masenger_app/app/core/constants/image/app_image.dart';
import '../../../common/widgets/common_widgets/custom_dialog.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.theme,
    this.imageUrl,
    this.onTap,
  });

  final ThemeData theme;
  final String? imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // ডিবাগ করার জন্য ইউআরএল প্রিন্ট করে দেখতে পারেন
    print("🖼️ [Profile Image Debug] -> $imageUrl");

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // ব্যাকগ্রাউন্ড কভার ইমেজ (এটি SVG, তাই SvgPicture ঠিক আছে)
        SizedBox(
          width: double.infinity,
          height: 160,
          child: SvgPicture.asset(AppImage.profileCover, fit: BoxFit.cover),
        ),

        // প্রোফাইল পিকচার সেকশন
        Positioned(
          bottom: -45,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: onTap ?? () {},
              child: ClipOval(
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: (imageUrl != null && imageUrl!.trim().isNotEmpty && imageUrl != "null")
                      ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      print("❌ [Network Image Error] -> $error");
                      // নেটওয়ার্ক ইমেজ ফেইল করলে ডিফল্ট আইকন দেখাবে (SVG নয়)
                      return Container(
                        color: Colors.grey.shade300,
                        child: Icon(Icons.person, size: 50, color: Colors.grey.shade700),
                      );
                    },
                  )
                      : Container(
                    // ইউজার ইমেজ না থাকলে ডিফল্ট ব্যাকগ্রাউন্ড ও আইকন
                    color: Colors.grey.shade300,
                    child: Icon(Icons.person, size: 50, color: Colors.grey.shade700),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}