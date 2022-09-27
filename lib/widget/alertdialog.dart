import 'package:flutter/material.dart';
import 'package:inventory_1/item_specific.dart';

class alertdialog extends StatelessWidget {
  String text;
  String text1;
  IconData icon;
  IconData icon1;
  String docId;
  alertdialog(
      {Key? key,
      required this.text,
      required this.icon,
      required this.text1,
      required this.icon1,
      required this.docId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 30,
      content: Container(
        height: 100,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ItemSpecific(
                    docId: docId,
                  );
                }));
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 22, 90, 145)),
                      ),
                      Icon(
                        icon,
                        color: Color.fromARGB(225, 22, 90, 145),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      icon1,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
