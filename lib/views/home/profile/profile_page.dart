import 'package:cargo/views/home/widgets/image_loader.dart';
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
    final ProfileController profileController = Get.find();

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
                    profileController.signOut();
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
            child: Obx(
                  () {
                final user = profileController.user.value;
                return Column(
                  children: [
                    CircleAvatar(
                      minRadius: 75,
                      maxRadius: 75,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: ImageLoader(
                          imageUrl: user.profilePicUrl,
                          imageColor: true,
                        ),
                      ),
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
                          filledIcon: FluentIcons.heart_24_filled,
                          text: "Favorite",
                          isSelected: profileController.activeTab.value == ProfileTab.favorite,
                          onTap: () => profileController.openFavoriteTab(),
                        ),
                        _buildTabButton(
                          icon: FluentIcons.mail_inbox_24_regular,
                          filledIcon: FluentIcons.mail_inbox_24_filled,
                          text: "Reservations",
                          isSelected: profileController.activeTab.value == ProfileTab.reservations,
                          onTap: () => profileController.openReservationsTab(),
                        ),
                        _buildTabButton(
                          icon: FluentIcons.settings_24_regular,
                          filledIcon: FluentIcons.settings_24_filled,
                          text: "Settings",
                          isSelected: profileController.activeTab.value == ProfileTab.settings,
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
                    Obx(
                          () {
                        final activeTab = profileController.activeTab.value;
                        if (activeTab == ProfileTab.favorite) {
                          return _buildFavoriteTabContent(profileController);
                        } else if (activeTab == ProfileTab.reservations) {
                          return _buildReservationsTabContent();
                        } else if (activeTab == ProfileTab.settings) {
                          return _buildSettingsTabContent();
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTabButton(
    {required IconData icon,
      required IconData filledIcon,
      required String text,
      required bool isSelected,
      required VoidCallback onTap}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            isSelected ? filledIcon : icon,
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

Widget _buildFavoriteTabContent(ProfileController profileController) {
  return Obx(
        () {
      final favoriteCars = profileController.user.value.favoriteCars;

      if (favoriteCars.isEmpty) {
        return const Center(
          child: Text("No favorite cars yet"),
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: favoriteCars.length,
          itemBuilder: (context, index) {
            final carId = favoriteCars[index];
            return ListTile(
              title: Text('Car ID: $carId'),
              trailing: IconButton(
                icon: const Icon(FluentIcons.delete_24_regular),
                onPressed: () {
                  profileController.removeFromFavorites(carId);
                },
              ),
            );
          },
        );
      }
    },
  );
}

Widget _buildReservationsTabContent() {
  return Container(
    // Replace with your reservations tab content
    child: const Center(
      child: Text("Reservations Tab Content"),
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