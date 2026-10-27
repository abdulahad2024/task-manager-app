import 'package:get/get.dart';

import '../controllers/verify_mail_controller.dart';

class VerifyMailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyMailController>(
      () => VerifyMailController(),
    );
  }
}
