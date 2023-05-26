import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';

class StoresController extends GetxController {
  // final RxList<Store> _allStores = RxList([]);
  // List<Store> get allStores => _allStores;
  // set allStores(List<Store> value) => _allStores.value = value;

  RxList<Store> storeList = RxList<Store>([]);

  @override
  void onInit() {
    super.onInit();

    FirebaseFirestore.instance.collection('stores').snapshots().listen(
      (event) {
        storeList(
          event.docs
              .map((doc) => Store.fromJson({...doc.data(), "id": doc.id}))
              .toList(),
        );
      },
      onError: (err) {
        print("Stores Stream error: $err");
      },
      onDone: () {
        print("Stores stream complete");
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
