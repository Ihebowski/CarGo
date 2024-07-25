import 'package:cargo/services/auth_service.dart';
import 'package:cargo/views/home/landing/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService authService = Get.find<AuthService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isObscure = true.obs;

  void signIn() async {
    try {
      await authService.signIn(emailController.text, passwordController.text);
      Get.snackbar('Success', 'Logged in successfully');
      Get.to(const HomePage());
    } catch (e) {
      Get.snackbar('Error', 'Failed to login');
    }
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}