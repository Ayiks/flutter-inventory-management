import 'package:flutter/material.dart';
import 'package:inventory_1/app/modules/admin/stores/widgets/store_info.dart';
import 'package:inventory_1/app/utils/dimmension.dart';

class StoreCard extends StatelessWidget {
  final String title;

  const StoreCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.height15),
      // height: 200,
      // color: Colors.black,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: const Column(
        children: [
          const ListTile(
            title: Text('Cold Store'),
            trailing: Icon(Icons.more_horiz),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StoreInfo(
                title: 'Products',
                subtitle: '200',
              ),
              StoreInfo(title: 'Total Cost', subtitle: 'Ghc 5,000'),
              StoreInfo(title: 'Total Cost', subtitle: 'Ghc 5,000')
            ],
          )
        ],
      ),
    );
  }
}
