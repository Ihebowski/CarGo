import 'package:cargo/controllers/profile_controller.dart';
import 'package:cargo/models/car.dart';
import 'package:cargo/views/home/car/feature_container.dart';
import 'package:cargo/views/home/widgets/image_loader.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:cargo/views/variables/contants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarPage extends StatelessWidget {
  final Car car;

  const CarPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final ProfileController profileController = Get.find();

    return Scaffold(
      backgroundColor: lightGreyColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: lightGreyColor,
            surfaceTintColor: Colors.transparent,
            collapsedHeight: height * 0.08,
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
                child: Obx(
                      () {
                    final isFavorite = profileController.isFavorite(car.id);
                    return IconButton(
                      onPressed: () {
                        if (isFavorite) {
                          profileController.removeFromFavorites(car.id);
                        } else {
                          profileController.addToFavorites(car.id);
                        }
                      },
                      icon: Icon(
                        isFavorite
                            ? FluentIcons.heart_24_filled
                            : FluentIcons.heart_24_regular,
                        size: iconSize,
                        color: blackColor,
                      ),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(whiteColor),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Container(
                  height: height * 0.325,
                  width: width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  decoration: const BoxDecoration(
                    color: lightGreyColor,
                  ),
                  child: ImageLoader(
                    imageUrl: car.carImage,
                    imageColor: true,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: const BoxDecoration(
                      color: whiteColor,
                      border: Border(
                        top: BorderSide(
                          color: darkLightGreyColor,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: darkLightGreyColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7.5, horizontal: 15),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: lightBlueColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                car.carHighlight,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: blackColor,
                                ),
                              ),
                            ),
                            Text(
                              "${car.yearManufacture} ${car.carBrand} ${car.carModel}",
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                            Text(
                              "${car.carType}, ${car.carMileage} Km",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: darkGreyColor,
                              ),
                            ),
                            FeatureContainer(car: car),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.10,
                  width: width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 5,
                  ),
                  decoration: const BoxDecoration(
                    color: lightGreyColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Price",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ),
                          ),
                          Text(
                            "${car.rentalPrice} TND/Day",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: darkGreyColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: height * 0.10,
                        width: width * 0.40,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Reserve",
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
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
