import 'package:cargo/models/car.dart';
import 'package:cargo/views/home/car_page.dart';
import 'package:cargo/views/home/image_loader.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentlyCard extends StatelessWidget {
  final Car car;

  const RecentlyCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(CarPage(car: car)),
      child: Container(
        width: 300,
        height: 100,
        margin: const EdgeInsets.only(top: 20, right: 15),
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: SizedBox(
                  width: 100,
                  height: 60,
                  child: ImageLoader(
                    imageUrl: car.carImage,
                    imageColor: true,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${car.carBrand} ${car.carModel}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Text(
                  car.yearManufacture,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Text(
                  "${car.rentalPrice} TND/Day",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: blackColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
