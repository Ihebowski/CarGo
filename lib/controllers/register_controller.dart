import 'package:cargo/services/auth_service.dart';
import 'package:cargo/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthService authService = Get.find<AuthService>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var genderController = ''.obs;
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final phoneController = TextEditingController();

  void register() async {
    try {
      String firstName = firstNameController.text.trim();
      String lastName = lastNameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();
      String gender = genderController.value;

      if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty || gender.isEmpty) {
        Get.snackbar('Error', 'All fields are required');
        return;
      }

      Map<String, dynamic> userDetails = {
        'userFirstname': firstName,
        'userLastname': lastName,
        'userGender': gender,
        'userEmail': email,
        'userPhone': phone,
      };

      await authService.register(email, password, userDetails);
      Get.snackbar('Success', 'Registered successfully');
      Get.offAll(const HomePage());
    } catch (e) {
      Get.snackbar('Error', 'Failed to register');
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
