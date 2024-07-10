import 'package:cargo/services/auth_service.dart';
import 'package:cargo/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthService authService = Get.find<AuthService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();

  // void register() async {
  //   try {
  //     Map<String, dynamic> userDetails = {
  //       'firstName': firstNameController.text,
  //       'lastName': lastNameController.text,
  //       'birthday': birthdayController.text,
  //       'gender': genderController.text,
  //       'phone': phoneController.text,
  //       'email': emailController.text,
  //     };
  //
  //     await authService.register(emailController.text, passwordController.text, userDetails);
  //     Get.snackbar('Success', 'Registered successfully');
  //     Get.offAll(const HomePage());
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to register');
  //   }
  // }
}
