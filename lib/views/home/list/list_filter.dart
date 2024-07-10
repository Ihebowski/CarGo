import 'package:cargo/views/variables/colors.dart';
import 'package:flutter/material.dart';

class ListFilter extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const ListFilter({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => onTap(),
        child: Chip(
          label: Text(
            name,
            style: TextStyle(
              color: isSelected ? blackColor : darkGreyColor,
            ),
          ),
          backgroundColor: lightGreyColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? blackColor : lightGreyColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
