import 'package:cargo/controllers/car_controller.dart';
import 'package:cargo/views/home/landing/recently_card.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentlyContainer extends StatelessWidget {
  const RecentlyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final CarController carController = Get.put(CarController());
    carController.fetchCars();

    return SizedBox(
      height: 175,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recently Added",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: lightGreyColor,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    FluentIcons.chevron_right_24_regular,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: Obx(
              () {
                if (carController.carList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: blackColor,
                    ),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: carController.carList.length,
                    itemBuilder: (context, index) {
                      final car = carController.carList[index];
                      return RecentlyCard(car: car);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
