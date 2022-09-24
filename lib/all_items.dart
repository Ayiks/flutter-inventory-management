import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_1/managers/product_manager.dart';

import 'widget/alertdialog.dart';

class AllItems extends StatelessWidget {
  AllItems({Key? key}) : super(key: key);

  final ProductManager _productManager = ProductManager();
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Items'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>?>>(
                stream: _productManager.getStock(value),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      snapshot.data == null) {
                    Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data == null) {
                    return Text("no dat available yet");
                  }
                  return ListView.separated(
                      padding: EdgeInsets.all(10),
                      itemBuilder: ((context, index) {
                        
                        return Container(
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Cow Meat',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('23:40;32'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.warning_amber_rounded,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '0 in Stock',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'GHC 390.00',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    GestureDetector(
                                        onTap: (() {
                                          showDialog(
                                              barrierColor: Colors.black45,
                                              context: context,
                                              builder: (context) {
                                                return alertdialog(
                                                  text: 'Edit Item',
                                                  text1: 'Delete Item',
                                                  icon: Icons.edit_note_rounded,
                                                  icon1: Icons
                                                      .delete_outline_rounded,
                                                );
                                              });
                                        }),
                                        child: Icon(Icons.more_horiz))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                      separatorBuilder: ((context, index) => Divider()),
                      itemCount: 2);
                })));
  }
}
