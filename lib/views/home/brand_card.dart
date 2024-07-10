import 'package:cargo/models/brand.dart';
import 'package:cargo/views/home/image_loader.dart';
import 'package:cargo/views/home/list_page.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandCard extends StatelessWidget {
  final Brand brand;

  const BrandCard({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        ListPage(
          brand: brand,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: lightGreyColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: ImageLoader(
                imageUrl: brand.brandImage,
                imageColor: false,
              ),
            ),
            SizedBox(
              height: 20,
              child: Text(
                brand.brandName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
