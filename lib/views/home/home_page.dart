import 'package:cargo/views/home/brand_container.dart';
import 'package:cargo/views/home/notification_page.dart';
import 'package:cargo/views/home/profile_page.dart';
import 'package:cargo/views/home/recently_container.dart';
import 'package:cargo/views/home/trending_container.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:cargo/views/variables/contants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            leading: Container(
              padding: const EdgeInsets.only(left: 10),
              height: 50,
              width: 50,
              child: const CircleAvatar(
                backgroundColor: blueColor,
              ),
            ),
            // title: Container(
            //   height: 50,
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(40),
            //     color: lightGreyColor,
            //   ),
            //   child: const TextField(
            //     decoration: InputDecoration(
            //       hintText: "Search",
            //       contentPadding: EdgeInsets.all(10.0),
            //       hintStyle: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.w400,
            //         color: darkGreyColor,
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //       ),
            //       prefixIcon: Icon(
            //         FluentIcons.search_24_regular,
            //         size: 28,
            //         color: darkGreyColor,
            //       ),
            //     ),
            //     cursorColor: blueColor,
            //   ),
            // ),
            actions: [
              IconButton(
                onPressed: () => Get.to(const NotificationPage()),
                icon: const Icon(
                  FluentIcons.alert_24_regular,
                  size: iconSize,
                  color: blackColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () => Get.to(const ProfilePage()),
                  icon: const Icon(
                    FluentIcons.person_24_regular,
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
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 50.0,
                    right: 50.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    "Shop smarter\nfor your next ride",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 20.0,
                  ),
                  child: Text(
                    "Browse thousands of vehicles, get financing, and schedule a test drive - all in one place.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: darkGreyColor,
                    ),
                  ),
                ),
                RecentlyContainer(),
                BrandContainer(),
                TrendingContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
