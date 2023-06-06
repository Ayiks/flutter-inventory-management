import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/modules/admin/stores/controllers/edit_store_controller.dart';
import 'package:inventory_1/app/modules/admin/stores/widgets/store_action_model.dart';

class StoresController extends GetxController {
  // final RxList<Store> _allStores = RxList([]);
  // List<Store> get allStores => _allStores;
  // set allStores(List<Store> value) => _allStores.value = value;

  RxList<Store> storeList = RxList<Store>([]);

  final RxList<Product> _products = RxList<Product>([]);
  List<Product> get products => _products;
  set products(List<Product> value) => _products.value = value;

  final EditStoreController editStoreController =
      Get.find<EditStoreController>();

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

  double getQuantity(Store store) {
    double stockValue = 0;
    FirebaseFirestore.instance
        .collection('products')
        .where('store_id', isEqualTo: store.id)
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

      stockValue += quantity + stock;
    }

    return stockValue;
  }

  void onDeleteStoreConfirmed(Store store) {
    final firebaseFirestore = FirebaseFirestore.instance;
    //TODO: complete deltions.
    // final productsCollection = firebaseFirestore.collection('products');
    // final orderCollection = firebaseFirestore.collection('order');
    // final userCollection = firebaseFirestore.collection('users');

    firebaseFirestore.collection('stores').doc(store.id).delete().then((_) {
      // productsCollection
      //     .where('store_id', isEqualTo: store.id)
      //     .get()
      //     .then((value) {
      //   for (DocumentSnapshot doc in value.docs) {
      //     doc.reference.delete();
      //   }
      // });
      FirebaseFirestore.instance.collection('dashboard').doc(store.id).delete();
      Get.back();
      Get.back();
      Get.snackbar("Success", "Store was deleted successfully");
    });
  }

  void showAlertDialog({required Store store}) {
    editStoreController.store = store;
    Get.dialog(StoreActionModal(store: store));
  }
}
