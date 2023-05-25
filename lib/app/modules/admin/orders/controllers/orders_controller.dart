import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_1/app/data/models/order/order.dart' as o;
import 'package:inventory_1/app/utils/helpers.dart';

class OrdersController extends GetxController {
  final TextEditingController filterFromDateTextEditingController =
      TextEditingController();
  final TextEditingController filterToDateTextEditingController =
      TextEditingController();

  final RxList<o.Order> _allOrders = RxList<o.Order>([]);
  List<o.Order> get allOrders => _allOrders;
  set allOrders(List<o.Order> value) => _allOrders.value = value;

  final RxList<o.Order> _filteredOrders = RxList<o.Order>([]);
  List<o.Order> get filteredOrders => _filteredOrders;
  set filteredOrders(List<o.Order> value) => _filteredOrders.value = value;

  final _todayOrders = RxList<o.Order>([]);
  List<o.Order> get todayOrders => _todayOrders;
  set todayOrders(List<o.Order> value) => _todayOrders.value = value;

  final Rx<DateTime> _filterFromDate = Rx<DateTime>(DateTime.now());
  DateTime get filterFromDate => _filterFromDate.value;
  set filterFromDate(DateTime value) => _filterFromDate.value = value;

  final Rx<DateTime> _fitlrerToDate = Rx<DateTime>(DateTime.now());
  DateTime get filterToDate => _fitlrerToDate.value;
  set filterToDate(DateTime value) => _fitlrerToDate.value = value;

  final RxDouble _totalSale = RxDouble(0);
  double get totalSale => _totalSale.value;
  set totalSale(double value) => _totalSale.value = value;

  final RxDouble _totalSaleQuantity = RxDouble(0);
  double get totalSaleQuantity => _totalSaleQuantity.value;
  set totalSaleQuantity(double value) => _totalSaleQuantity.value = value;

  @override
  void onInit() {
    super.onInit();

// initialize the dates
    // filterFromDateTextEditingController.text =
    //     DateFormat.yMMMMd().format(filterFromDate);

    // filterToDateTextEditingController.text =
    //     DateFormat.yMMMMd().format(filterToDate);

// fetch from Firestore
    FirebaseFirestore.instance
        .collection('orders')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) {
      _allOrders(
        event.docs.map((doc) {
          o.Order order = o.Order.fromJson({...doc.data(), "id": doc.id});
          return order;
        }).toList(),
      );

// filter the allProducts
      filterOrders();
      todaysOrders();
    });
  }

  void openDatePicker({bool setFromDate = false}) {
    showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now().add(const Duration(days: 365 * 30)))
        .then((value) {
      if (value != null) {
        if (setFromDate == true) {
          filterFromDateTextEditingController.text =
              DateFormat.yMMMMd().format(value);
          filterFromDate = value;
        } else {
          filterToDateTextEditingController.text =
              DateFormat.yMMMMd().format(value);
          filterToDate = value;
        }
      }
    });
  }

  void filterOrders() {
    int diff = filterToDate.compareTo(filterFromDate);
    if (diff == -1) {
      String message =
          "The end date: ${filterToDateTextEditingController.text} must be after the start date: ${filterFromDateTextEditingController.text}";

      showSnackBar(message: message);
    }

    filteredOrders = allOrders.where((order) {
      Timestamp? createdAt = order.createdAt;

      if (createdAt != null) {
        return createdAt.toDate().compareTo(filterFromDate) > 0 &&
            createdAt.toDate().compareTo(filterToDate) < 1;
      }
      return false;
    }).toList();

    totalSale = 0;
    totalSaleQuantity = 0;
    for (o.Order order in filteredOrders) {
      totalSale += order.total;
      totalSaleQuantity += order.orderQuantity;
    }
  }

  void todaysOrders() {
    todayOrders = allOrders.where((order) {
      Timestamp? createdAt = order.createdAt;
      final now = DateTime.now();
      final newCreatedAt = DateFormat.yMMMEd().format(createdAt!.toDate());
      final newNow = DateFormat.yMMMEd().format(now);

      if (newCreatedAt == newNow) {
        return true;
      }
      return false;
    }).toList();
  }
}
