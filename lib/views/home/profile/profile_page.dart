import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:cargo/controllers/profile_controller.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:cargo/views/variables/contants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

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
                  onPressed: () {
                    profileController.authService.signOut();
                  },
                  icon: const Icon(
                    FluentIcons.sign_out_24_regular,
                    size: iconSize,
                    color: blackColor,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Obx(() {
              final user = profileController.user.value;
              if (user == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    const CircleAvatar(
                      backgroundColor: blueColor,
                      minRadius: 75,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 30),
                      child: Text(
                        "${user.userFirstname} ${user.userLastname}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: darkGreyColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTabButton(
                          icon: FluentIcons.heart_24_regular,
                          text: "Favorite",
                          onTap: () => profileController.openFavoriteTab(),
                        ),
                        _buildTabButton(
                          icon: FluentIcons.edit_24_regular,
                          text: "Edit",
                          onTap: () => profileController.openEditTab(),
                        ),
                        _buildTabButton(
                          icon: FluentIcons.settings_24_regular,
                          text: "Settings",
                          onTap: () => profileController.openSettingsTab(),
                        ),
                      ],
                    ),
                    const Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: Divider(
                        color: darkLightGreyColor,
                      ),
                    ),
                    Obx(() {
                      final activeTab = profileController.activeTab.value;
                      if (activeTab == ProfileTab.Favorite) {
                        return _buildFavoriteTabContent();
                      } else if (activeTab == ProfileTab.Edit) {
                        return _buildEditTabContent();
                      } else if (activeTab == ProfileTab.Settings) {
                        return _buildSettingsTabContent();
                      } else {
                        return Container();
                      }
                    }),
                  ],
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

Widget _buildTabButton(
    {required IconData icon, required String text, required VoidCallback onTap}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: iconSize,
            color: blackColor,
          ),
        ),
      ),
      Text(
        text,
      ),
    ],
  );
}

Widget _buildFavoriteTabContent() {
  return Container(
    // Replace with your favorite tab content
    child: const Center(
      child: Text("Favorite Tab Content"),
    ),
  );
}

Widget _buildEditTabContent() {
  return Container(
    // Replace with your edit tab content
    child: const Center(
      child: Text("Edit Tab Content"),
    ),
  );
}

Widget _buildSettingsTabContent() {
  return Container(
    // Replace with your settings tab content
    child: const Center(
      child: Text("Settings Tab Content"),
    ),
  );
}
