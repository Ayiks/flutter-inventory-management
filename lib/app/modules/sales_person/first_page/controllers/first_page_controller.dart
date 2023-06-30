import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:inventory_1/app/modules/admin/orders/controllers/orders_controller.dart';

class FirstPageController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
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

    // firebaseFirestore
    //     .collection('products')
    //     .where('storeId', isEqualTo: userCompanyId)
    //     .snapshots()
    //     .listen((event) {

    //     });
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
