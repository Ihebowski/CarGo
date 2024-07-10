import 'package:cargo/views/variables/colors.dart';
import 'package:flutter/material.dart';

class ListFilter extends StatelessWidget {
  final String name;
  final bool status;

  const ListFilter({
    super.key,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Chip(
        label: Text(
          name,
          style: TextStyle(
            color: status?blackColor:darkGreyColor,
          ),
        ),
        backgroundColor: lightGreyColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: status?blackColor:lightGreyColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
