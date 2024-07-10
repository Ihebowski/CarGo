import 'package:cargo/views/variables/colors.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 15),
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Electric Cars",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Text(
                  "Go electric, drive toward a greener envirement.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: darkGreyColor,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/tesla-cover.png",
            height: 125,
            width: 125,
            fit: BoxFit.fitHeight,
            alignment: FractionalOffset.centerLeft,
          ),
        ],
      ),
    );
  }
}
