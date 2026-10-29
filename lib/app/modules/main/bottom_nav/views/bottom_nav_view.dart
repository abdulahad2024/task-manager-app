import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';
import 'package:task_masenger_app/app/modules/main/home/views/home_view.dart';
import 'package:task_masenger_app/app/modules/profile/profile/views/profile_view.dart';
import 'package:task_masenger_app/app/modules/task/add_task/views/add_task_view.dart';

import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final controller = Get.isRegistered<BottomNavController>()
        ? Get.find<BottomNavController>()
        : Get.put(BottomNavController());

    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.motionTabBarController,
        children: const [
          HomeView(),
          AddTaskView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: controller.motionTabBarController,
        initialSelectedTab: "Home",
        labels: const ["Home", "Add Task", "Profile"],
        icons: const [Ionicons.home, Ionicons.add, Ionicons.person],
        tabSize: 50,
        tabBarHeight: 60,
        textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white70 : Colors.black54,
        ),
        tabIconColor: isDark ? Colors.grey.shade400 : Colors.grey,
        tabIconSelectedColor: Colors.white,
        tabSelectedColor: AppColor.primaryColor,
        tabBarColor: theme.cardColor,
        onTabItemSelected: (int value) => controller.changeTab(value),
      ),
    );
  }
}