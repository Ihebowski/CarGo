import 'package:cargo/controllers/register_controller.dart';
import 'package:cargo/views/auth/login_page.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());
    final width = MediaQuery.sizeOf(context).width;
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
                  "Register",
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: (width / 2) - 45,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              controller:
                                  registerController.firstNameController,
                              decoration: InputDecoration(
                                hintText: "Firstname",
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
                            width: (width / 2) - 45,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              controller: registerController.lastNameController,
                              decoration: InputDecoration(
                                hintText: "Lastname",
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
                        ],
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
                        controller: registerController.emailController,
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
                        controller: registerController.passwordController,
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
                    Obx(
                      () => Container(
                        height: 50,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 54,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: DropdownButton<String>(
                          hint: const Text('Gender'),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: darkGreyColor,
                          ),
                          underline: Container(),
                          dropdownColor: lightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          value:
                              registerController.genderController.value.isEmpty
                                  ? null
                                  : registerController.genderController.value,
                          onChanged: (newValue) {
                            registerController.genderController.value =
                                newValue!;
                          },
                          items: registerController.genderOptions.map((gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                        ),
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
                        controller: registerController.phoneController,
                        decoration: InputDecoration(
                          hintText: "Phone",
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
                      child: Row(
                        children: [
                          Obx(
                            () {
                              return Checkbox(
                                value: registerController.isChecked.value,
                                side: const BorderSide(
                                  color: darkLightGreyColor,
                                ),
                                activeColor: darkLightGreyColor,
                                checkColor: blackColor,
                                onChanged: (value) {
                                  registerController.isChecked.value = value!;
                                },
                              );
                            },
                          ),
                          const Text(
                            "I agree to the Terms and Conditions.",
                            style: TextStyle(
                              fontSize: 14,
                              color: darkGreyColor,
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
                        vertical: 15,
                      ),
                      child: ElevatedButton(
                        onPressed: () => registerController.signUp(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Register",
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
                  onTap: () => Get.to(const LoginPage()),
                  child: const Text(
                    "Do you have an account?",
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
