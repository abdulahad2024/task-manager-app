import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class BottomNavController extends GetxController with GetTickerProviderStateMixin {
  late MotionTabBarController motionTabBarController;

  @override
  void onInit() {
    super.onInit();
    motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void onClose() {
    motionTabBarController.dispose();
    super.onClose();
  }

  final RxInt selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
    motionTabBarController.index = index;
  }

  void goToHome() {
    selectedIndex.value = 0;
  }


}