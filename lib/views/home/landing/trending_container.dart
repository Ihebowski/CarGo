import 'package:cargo/views/home/landing/trending_card.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:flutter/material.dart';

class TrendingContainer extends StatelessWidget {
  const TrendingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  TrendingCard(),
                  TrendingCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
