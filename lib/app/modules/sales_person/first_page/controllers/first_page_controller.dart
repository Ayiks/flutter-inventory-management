import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/product/product.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/routes/app_pages.dart';

class FirstPageController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // final OrdersController _orderController = Get.find<OrdersController>();
  // final DashboardController _dashboardController =
  //     Get.find<DashboardController>();

  String userName = '';
  String userCompanyId = '';
  String phoneNumber = '';

  final _todaySales = ''.obs;
  get todaySales => this._todaySales.value;
  set todaySales(value) => this._todaySales.value = value;

  final store = Rx<Store>(Store(id: '', name: '', location: ''));

  final RxList<Product> _products = RxList<Product>([]);
  List<Product> get products => _products;
  set products(List<Product> value) => _products.value = value;

  @override
  void onInit() {
    super.onInit();
    final List<String> user = Get.arguments;
    userName = user[1];
    userCompanyId = user[0];
    // phoneNumber = user[2];

    firebaseFirestore
        .collection('stores')
        .doc(userCompanyId)
        .get()
        .then((value) {
      var data = value.data() as dynamic;
      store(Store.fromJson({...data, "id": value.id}));
    });

    firebaseFirestore
        .collection('products')
        .where('storeId', isEqualTo: userCompanyId)
        .snapshots()
        .listen((event) {
      _products(event.docs
          .map((e) => Product.fromJson({...e.data(), "id": e.id}))
          .toList());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> handleSignOut() async {
    await _firebaseAuth.signOut();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
