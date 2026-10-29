import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class BottomNavController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final MotionTabBarController motionTabBarController;

  final RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  void changeTab(int index) {
    if (index < 0 || index >= motionTabBarController.length) return;
    selectedIndex.value = index;
    if (motionTabBarController.index != index) {
      motionTabBarController.animateTo(index);
    }
  }

  void goToHome() => changeTab(0);

  @override
  void onClose() {
    motionTabBarController.dispose();
    super.onClose();
  }
}