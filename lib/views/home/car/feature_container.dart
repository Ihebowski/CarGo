import 'package:cargo/models/car.dart';
import 'package:cargo/views/home/car/feature_card.dart';
import 'package:cargo/views/variables/colors.dart';
import 'package:flutter/material.dart';

class FeatureContainer extends StatefulWidget {
  final Car car;

  const FeatureContainer({
    super.key,
    required this.car,
  });

  @override
  State<FeatureContainer> createState() => _FeatureContainerState();
}

class _FeatureContainerState extends State<FeatureContainer> {
  String selectedChip = "Basic Information";

  @override
  Widget build(BuildContext context) {
    List<FeatureCard> getFeatureCards() {
      switch (selectedChip) {
        case "Basic Information":
          return [
            FeatureCard(title: "Type", content: widget.car.carType),
            FeatureCard(title: "Color", content: widget.car.carColor),
            FeatureCard(
                title: "Transmission", content: widget.car.transmissionType),
            FeatureCard(title: "Fuel", content: widget.car.fuelType),
          ];
        case "Performance & Capacity":
          return [
            FeatureCard(
                title: "Horsepower", content: "${widget.car.horsepower} HP"),
            FeatureCard(
                title: "Efficiency",
                content: "${widget.car.fuelEfficiency} L/100"),
            FeatureCard(title: "Seat", content: widget.car.seatingCapacity),
            FeatureCard(title: "Trunk", content: "${widget.car.trunkSpace} L"),
          ];
        case "Condition & Maintenance":
          return [
            FeatureCard(title: "Condition", content: ""),
            FeatureCard(title: "Last Service", content: ""),
            FeatureCard(title: "Mileage", content: ""),
            FeatureCard(title: "Warranty", content: ""),
          ];
        default:
          return [];
      }
    }

    return Column(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ChoiceChip(
                  showCheckmark: false,
                  label: const Text("Basic Information"),
                  selected: selectedChip == "Basic Information",
                  onSelected: (isSelected) {
                    setState(() {
                      selectedChip = "Basic Information";
                    });
                  },
                  backgroundColor: lightGreyColor,
                  selectedColor: lightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: BorderSide(
                    color: selectedChip == "Basic Information"
                        ? blackColor
                        : lightGreyColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ChoiceChip(
                  showCheckmark: false,
                  label: const Text("Performance & Capacity"),
                  selected: selectedChip == "Performance & Capacity",
                  onSelected: (isSelected) {
                    setState(() {
                      selectedChip = "Performance & Capacity";
                    });
                  },
                  backgroundColor: lightGreyColor,
                  selectedColor: lightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: BorderSide(
                    color: selectedChip == "Performance & Capacity"
                        ? blackColor
                        : lightGreyColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ChoiceChip(
                  showCheckmark: false,
                  label: const Text("Condition & Maintenance"),
                  selected: selectedChip == "Condition & Maintenance",
                  onSelected: (isSelected) {
                    setState(() {
                      selectedChip = "Condition & Maintenance";
                    });
                  },
                  backgroundColor: lightGreyColor,
                  selectedColor: lightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: BorderSide(
                    color: selectedChip == "Condition & Maintenance"
                        ? blackColor
                        : lightGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: getFeatureCards(),
          ),
        ),
      ],
    );
  }
}
