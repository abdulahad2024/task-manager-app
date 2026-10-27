import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_masenger_app/app/core/constants/image/app_image.dart';
import '../../../common/widgets/common_widgets/custom_dialog.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 160,
          child: SvgPicture.asset(AppImage.profileCover, fit: BoxFit.cover),
        ),

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
              onTap: () {
                CustomDialog.show(
                  context: context,
                  title: "Success",
                  message: "Your task has been added successfully.",
                  confirmText: "OK",
                  onConfirm: () {},
                );
              },
              child: const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/158837112?v=4',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
