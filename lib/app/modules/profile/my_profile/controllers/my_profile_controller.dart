import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:task_masenger_app/app/data/services/user_services.dart';

class MyProfileController extends GetxController {
  final UserServices _userServices = UserServices();

  var isLoading = false.obs;
  var userData = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    try {
      isLoading.value = true;
      final response = await _userServices.getProfile();
      if (response != null && response['data'] != null) {
        userData.value = Map<String, dynamic>.from(response['data']);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}