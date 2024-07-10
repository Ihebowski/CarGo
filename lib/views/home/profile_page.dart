import 'package:cargo/views/variables/colors.dart';
import 'package:cargo/views/variables/contants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
            surfaceTintColor: Colors.transparent,
            collapsedHeight: 80,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                FluentIcons.chevron_left_24_regular,
                size: iconSize,
                color: blackColor,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FluentIcons.power_24_regular,
                    size: iconSize,
                    color: blackColor,
                  ),
                ),
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: blueColor,
                  minRadius: 75,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 30),
                  child: Text(
                    "Firstname Lastname",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: darkGreyColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Icon(
                            FluentIcons.heart_24_regular,
                            size: iconSize,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "Favorite",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Icon(
                            FluentIcons.edit_24_regular,
                            size: iconSize,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "Edit",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Icon(
                            FluentIcons.settings_24_regular,
                            size: iconSize,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "Settings",
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Divider(
                    color: darkLightGreyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
