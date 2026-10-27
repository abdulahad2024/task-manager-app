import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_masenger_app/app/modules/profile/widgets/profile_header.dart';
import 'package:task_masenger_app/app/modules/profile/widgets/profile_menu_list.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(theme: theme),

            const SizedBox(height: 60),

            ProfileMenuList(),
          ],
        ),
      ),
    );
  }
}

