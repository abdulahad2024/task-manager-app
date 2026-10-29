import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/modules/profile/widgets/profile_card.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          ProfileCard(
            icon: Ionicons.personOutline,
            title: AppString.myProfile,
            onTap: () {
              Get.toNamed('${Routes.PROFILE}${Routes.MY_PROFILE}');            },
          ),
          const SizedBox(height: 12),
          ProfileCard(
            icon: Ionicons.settingsOutline,
            title: AppString.accountSetting,
            onTap: () {
              Get.toNamed(Routes.ACCOUNT_SETTINGS);            },

          ),

          const SizedBox(height: 20),

          Text(AppString.moreSection, style: theme.textTheme.titleMedium),

          const SizedBox(height: 12),

          ProfileCard(
            icon: Ionicons.newspaperOutline,
            title: AppString.termsAndCondition,
            onTap: () {
              Get.toNamed(Routes.TEARMS_CONDITION);
            },
          ),
          const SizedBox(height: 12),
          ProfileCard(
            icon: Icons.privacy_tip_outlined,
            title: AppString.privacyPolicy,
            onTap: () {
              Get.toNamed(Routes.PRIVACY_POLICY);
            },
          ),
          const SizedBox(height: 12),
          ProfileCard(
            icon: Ionicons.helpCircleOutline,
            title: AppString.helpSupport,
            onTap: () {
              Get.toNamed(Routes.HELP_CENTER);

            },
          ),
          const SizedBox(height: 12),
          ProfileCard(
            icon: Ionicons.logOutOutline,
            title: AppString.logOut,
            onTap: () {
              // Log out logic here
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
