import 'package:cargo/controllers/login_controller.dart';
import 'package:cargo/views/auth/register_page.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 5,
                      ),
                      child: TextField(
                        controller: loginController.emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: darkGreyColor,
                          ),
                          filled: true,
                          fillColor: lightGreyColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: lightGreyColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: blackColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        cursorColor: blueColor,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 5,
                      ),
                      child: TextField(
                        controller: loginController.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: darkGreyColor,
                            ),
                            filled: true,
                            fillColor: lightGreyColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: lightGreyColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: blackColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            suffixIcon: const Icon(
                              FluentIcons.eye_24_regular,
                              color: blackColor,
                            )),
                        cursorColor: blueColor,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 65, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: darkGreyColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 25,
                      ),
                      child: ElevatedButton(
                        onPressed: () => loginController.signIn(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.to(const RegisterPage()),
                  child: const Text(
                    "You don't have an account?",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
