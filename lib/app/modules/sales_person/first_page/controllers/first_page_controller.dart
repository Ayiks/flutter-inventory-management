import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';

class FirstPageController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  String userName = '';
  String userCompanyId = '';
  String phoneNumber = '';

  final store = Rx<Store>(Store(id: '', name: '', location: ''));

  @override
  void onInit() {
    super.onInit();
    final List<String> user = Get.arguments;
    userName = user[1];
    userCompanyId = user[0];
    phoneNumber = user[2];

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
