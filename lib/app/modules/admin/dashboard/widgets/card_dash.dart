import 'package:flutter/material.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final String value;
  final void Function()? onTap;

  const StatCard({
    Key? key,
    required this.icon,
    required this.label,
    this.color,
    required this.value,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: Dimensions.iconSize24 + 6,
                color: color,
              ),
              Text(
                label,
                style: TextStyle(
                    fontSize: Dimensions.font16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: Dimensions.font20 + 5, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
