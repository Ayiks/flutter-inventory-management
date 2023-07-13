import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/modules/admin/stores/controllers/edit_store_controller.dart';
import 'package:inventory_1/app/modules/admin/stores/widgets/store_action_model.dart';
import 'package:inventory_1/app/routes/app_pages.dart';

class StoresController extends GetxController {
  // final DashboardController _dashboardController =
  //     Get.find<DashboardController>();

  //to fix the product length

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  RxList<Store> storeList = RxList<Store>([]);

  final RxList<Product> _products = RxList<Product>([]);
  List<Product> get products => _products;
  set products(List<Product> value) => _products.value = value;

  final RxBool _isDeleting = false.obs;
  bool get isDeleting => _isDeleting.value;
  set isDeleting(bool value) => _isDeleting.value = value;

  final EditStoreController editStoreController =
      Get.find<EditStoreController>();

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      storeStreamSubscription;
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      productStreamSubscription;

  @override
  void onInit() {
    super.onInit();

    storeStreamSubscription =
        FirebaseFirestore.instance.collection('stores').snapshots().listen(
      (event) {
        storeList(
          event.docs
              .map((doc) => Store.fromJson({...doc.data(), "id": doc.id}))
              .toList(),
        );
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    storeStreamSubscription.cancel();
    productStreamSubscription.cancel();
    super.onClose();
  }

  double getQuantity(Store store) {
    double stockValue = 0;

    productStreamSubscription = FirebaseFirestore.instance
        .collection('products')
        .where('storeId', isEqualTo: store.id)
        .snapshots()
        .listen((event) {
      _products(event.docs
          .map((e) => Product.fromJson({...e.data(), "id": e.id}))
          .toList());
    });

    for (var element in products) {
      double quantity = 0;
      double stock = 0;

      quantity = element.quantity;
      stock = element.price;

      stockValue += quantity * stock;
    }

    // productStreamSubscription.cancel();
    return stockValue;
  }

  // void onDeleteStoreConfirmed(Store store) {
  //   final firebaseFirestore = FirebaseFirestore.instance;

  //   final productsCollection = firebaseFirestore.collection('products');
  //   final orderCollection = firebaseFirestore.collection('order');
  //   final userCollection = firebaseFirestore.collection('users');

  //   //delete all users related to the store
  //   firebaseFirestore.collection('stores').doc(store.id).delete().then((_) {
  //     userCollection.where('company', isEqualTo: store.id).get().then((value) {
  //       for (DocumentSnapshot doc in value.docs) {
  //         doc.reference.delete();
  //       }
  //     });

  //     //delete all orders related to the store
  //     orderCollection.where('storeId', isEqualTo: store.id).get().then((value) {
  //       for (DocumentSnapshot doc in value.docs) {
  //         doc.reference.delete();
  //       }
  //     });

  //     //delete all products related to the store
  //     productsCollection
  //         .where('storeId', isEqualTo: store.id)
  //         .get()
  //         .then((value) {
  //       for (DocumentSnapshot doc in value.docs) {
  //         doc.reference.delete();
  //       }
  //     });
  //     FirebaseFirestore.instance.collection('dashboard').doc(store.id).delete();
  //     Get.back();
  //     Get.back();
  //     Get.snackbar("Success", "Store was deleted successfully");
  //   });
  // }

  void onDeleteStoreConfirmed(Store store) async {
    isDeleting = true;
    final firebaseFirestore = FirebaseFirestore.instance;
    final productsCollection = firebaseFirestore.collection('products');
    final orderCollection = firebaseFirestore.collection('orders');
    final userCollection = firebaseFirestore.collection('users');

    try {
      // Delete all users related to the store
      final usersSnapshot =
          await userCollection.where('company', isEqualTo: store.id).get();
      for (DocumentSnapshot doc in usersSnapshot.docs) {
        await doc.reference.delete();
      }

      // Delete all orders related to the store
      final ordersSnapshot =
          await orderCollection.where('storeId', isEqualTo: store.id).get();
      for (DocumentSnapshot doc in ordersSnapshot.docs) {
        await doc.reference.delete();
      }

      // Delete all products related to the store
      final productsSnapshot =
          await productsCollection.where('storeId', isEqualTo: store.id).get();
      for (DocumentSnapshot doc in productsSnapshot.docs) {
        await doc.reference.delete();
      }

      // Delete store document itself
      await firebaseFirestore.collection('stores').doc(store.id).delete();
      await FirebaseFirestore.instance
          .collection('dashboard')
          .doc(store.id)
          .delete();

      Get.back();
      Get.back();
      Get.snackbar("Success", "Store was deleted successfully");
    } catch (error) {
      Get.snackbar("Error", "An error occurred while deleting the store");
      // Handle or log the error as needed
    } finally {
      isDeleting = false;
    }
  }

  void showAlertDialog({required Store store}) {
    editStoreController.store = store;
    Get.dialog(StoreActionModal(store: store));
  }

  Future<void> handleSignOut() async {
    await _firebaseAuth.signOut();
    onClose();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
