import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
 

  Product({
    required this.name,
    required this.type,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  String name;
  String type;
  double price;
  int quantity;
  int productId;


  factory Product.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      Product(
        name: doc.data()!['name'],
        type: doc.data()!['type'],
        price: doc.data()!['costPrice'],
        quantity: doc.data()!['quantity'],
        productId: doc.data()!['productId'],
       
      );

      Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'costPrice': price,
        'quantity': quantity,
        'productId': productId,
      };

 
}