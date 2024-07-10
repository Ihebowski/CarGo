import 'package:cargo/models/car.dart';
import 'package:cargo/views/home/car_page.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'image_loader.dart';

class ListCard extends StatelessWidget {
  final Car car;

  const ListCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(CarPage(car: car)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: lightGreyColor,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: lightBlueColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    car.carHighlight,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: blackColor,
                    ),
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
                    FluentIcons.heart_24_regular,
                    size: 18,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: ImageLoader(
                  imageUrl: car.carImage,
                  imageColor: true,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  car.yearManufacture,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Text(
                  "${car.carBrand} ${car.carModel}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Text(
                  "${car.carType}, ${car.carMileage} km",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: darkGreyColor,
                  ),
                ),
              ],
            ),
            Text(
              "${car.rentalPrice} TND per day",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: blackColor,
              ),
            ),
            const Text(
              "0 down payment",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
