import 'package:flutter/material.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class StoreInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  const StoreInfo({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: Dimensions.height10,
        ),
        Text(subtitle)
      ],
    );
  }
}
