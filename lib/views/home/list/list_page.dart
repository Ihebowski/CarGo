import 'package:cargo/controllers/car_controller.dart';
import 'package:cargo/models/brand.dart';
import 'package:cargo/views/home/list/list_card.dart';
import 'package:cargo/views/home/list/list_filter.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:cargo/views/variables/contants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ListPage extends StatelessWidget {
  final Brand brand;

  const ListPage({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final CarController carController = Get.put(CarController());
    carController.fetchCarsByBrand(brand.id);

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
            title: Container(
              height: 50,
              padding: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: lightGreyColor,
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  carController.filterCars(value);
                },
                decoration: const InputDecoration(
                  hintText: "Search",
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: darkGreyColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(
                    FluentIcons.search_24_regular,
                    size: iconSize,
                    color: darkGreyColor,
                  ),
                ),
                cursorColor: blueColor,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FluentIcons.filter_24_regular,
                    size: iconSize,
                    color: blackColor,
                  ),
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(lightGreyColor),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        brand.brandName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                      Obx(
                        () {
                          return Text(
                            "${carController.filteredCarList.length.toString()} Found",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 15,
                    bottom: 15,
                  ),
                  child: Obx(
                    () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListFilter(
                            name: "Lowest Price",
                            isSelected: carController.selectedFilter.value ==
                                'Lowest Price',
                            onTap: () {
                              carController.applyFilter('Lowest Price');
                            },
                          ),
                          ListFilter(
                            name: "Highest Price",
                            isSelected: carController.selectedFilter.value ==
                                'Highest Price',
                            onTap: () {
                              carController.applyFilter('Highest Price');
                            },
                          ),
                          ListFilter(
                            name: "Lowest Mileage",
                            isSelected: carController.selectedFilter.value ==
                                'Lowest Mileage',
                            onTap: () {
                              carController.applyFilter('Lowest Mileage');
                            },
                          ),
                          ListFilter(
                            name: "Highest Mileage",
                            isSelected: carController.selectedFilter.value ==
                                'Highest Mileage',
                            onTap: () {
                              carController.applyFilter('Highest Mileage');
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () {
              if (carController.isLoading.value) {
                // Show loading image
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 50,
                        right: 15,
                      ),
                      child: Lottie.asset(
                        "assets/animations/car-loading.json",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                );
              } else if (carController.filteredCarList.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 50,
                      right: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/empty.png",
                          width: 75,
                          height: 75,
                        ),
                        const Text(
                          "Empty",
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisExtent: 300,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final car = carController.filteredCarList[index];
                      return ListCard(car: car);
                    },
                    childCount: carController.filteredCarList.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
