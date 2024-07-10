import 'package:cargo/controllers/brand_controller.dart';
import 'package:cargo/views/home/landing/brand_card.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandContainer extends StatelessWidget {
  const BrandContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final BrandController brandController = Get.put(BrandController());

    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Browse by Brand",
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
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 125,
            child: Obx(
              () {
                if (brandController.brandList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: brandController.brandList.length,
                    itemBuilder: (context, index) {
                      final brand = brandController.brandList[index];
                      return BrandCard(brand: brand);
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
