import 'package:cargo/views/variables/colors.dart';
import 'package:cargo/views/variables/contants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
                    FluentIcons.delete_24_regular,
                    size: iconSize,
                    color: blackColor,
                  ),
                ),
              ),
            ],
          ),
          const SliverToBoxAdapter(),
        ],
      ),
    );
  }
}
