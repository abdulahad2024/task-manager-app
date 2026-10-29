import 'package:get/get.dart';

import '../controllers/tearms_condition_controller.dart';

class TearmsConditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TearmsConditionController>(
      () => TearmsConditionController(),
    );
  }
}
