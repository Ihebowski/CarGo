import 'package:cargo/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:cargo/controllers/profile_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put(ProfileController());
  }
}
