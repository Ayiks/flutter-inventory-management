import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inventory_1/app/data/models/store/store.dart';
import 'package:inventory_1/app/modules/admin/stores/controllers/edit_store_controller.dart';
import 'package:inventory_1/app/modules/admin/stores/widgets/store_action_model.dart';

class StoresController extends GetxController {
  // final RxList<Store> _allStores = RxList([]);
  // List<Store> get allStores => _allStores;
  // set allStores(List<Store> value) => _allStores.value = value;

  RxList<Store> storeList = RxList<Store>([]);

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

  void showAlertDialog({required Store store}) {
    editStoreController.store = store;
    Get.dialog(StoreActionModal(store: store));
  }
}
