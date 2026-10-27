import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_masenger_app/app/core/constants/string/app_string.dart';
import 'package:task_masenger_app/app/modules/profile/widgets/profile_card.dart';

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
            onTap: () {},
          ),
          const SizedBox(height: 12),
          ProfileCard(
            icon: Ionicons.settingsOutline,
            title: AppString.accountSetting,
            onTap: () {},
          ),

          const SizedBox(height: 20),

          // "More" সেকশন টাইটেল
          Text(AppString.moreSection, style: theme.textTheme.titleMedium),

          const SizedBox(height: 12),

          ProfileCard(
            icon: Ionicons.newspaperOutline,
            title: AppString.termsAndCondition,
            onTap: () {},
          ),
          const SizedBox(height: 12),
          ProfileCard(
            icon: Icons.privacy_tip_outlined,
            title: AppString.privacyPolicy,
            onTap: () {},
          ),
          const SizedBox(height: 12),
          ProfileCard(
            icon: Ionicons.helpCircleOutline,
            title: AppString.helpSupport,
            onTap: () {},
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
