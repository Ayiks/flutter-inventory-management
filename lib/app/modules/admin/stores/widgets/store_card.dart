import 'package:flutter/material.dart';
import 'package:inventory_1/app/modules/admin/stores/widgets/store_info.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class StoreCard extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final String numberOfProducts;
  final String valueOfProducts;

  const StoreCard(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.numberOfProducts,
      required this.valueOfProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.height15),
      // height: 200,
      // color: Colors.black,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            trailing: GestureDetector(
                onTap: onPressed, child: const Icon(Icons.more_horiz)),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StoreInfo(
                title: 'Products',
                subtitle: numberOfProducts,
              ),
              StoreInfo(title: 'Total Stock Value', subtitle: valueOfProducts),
              StoreInfo(title: 'Total Cost', subtitle: 'Ghc 5,000')
            ],
          )
        ],
      ),
    );
  }
}
