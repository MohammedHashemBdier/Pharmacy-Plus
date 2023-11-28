import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/models/order_model.dart';

class OrderController extends GetxController {
  List<OrderModel> orders = [];
  List<OrderModel> filterorders = [];
  TextEditingController ordersearchController = TextEditingController();

  @override
  void onReady() {
    super.onReady();

    fetchOrders();
    filterOrder();
    ordersearchController.addListener(() => filterOrder());
  }

  void fetchOrders() {
    orders = [
      OrderModel(
        OrderID: 8662,
        PharmacyNumber: 00963997629626,
        Price: 50000,
        Quantity: 30,
        status: 'preparing'.tr,
        OrderDate: DateTime(DateTime.may),
        paymentstatus: true,
      ),
      OrderModel(
        OrderID: 57373,
        PharmacyNumber: 0096398463157,
        Price: 200000,
        Quantity: 95,
        status: 'sent'.tr,
                paymentstatus: false,

        OrderDate: DateTime(DateTime.may),
      ),
      OrderModel(
        OrderID: 33,
        PharmacyNumber: 009639854126858,
        Price: 200,
        Quantity: 1,
        status: 'received'.tr,
                paymentstatus: false,

        OrderDate: DateTime(DateTime.may),
      ),
      OrderModel(
        OrderID: 3773,
        PharmacyNumber: 00963987425168,
        Price: 95200,
        Quantity: 18,
        status: 'preparing'.tr,
                paymentstatus: true,

        OrderDate: DateTime(DateTime.may),
      ),
      OrderModel(
        OrderID: 852,
        PharmacyNumber: 00963965824757,
        Price: 50000,
        Quantity: 10,
        status: 'preparing'.tr,
                paymentstatus: false,

        OrderDate: DateTime(DateTime.may),
      ),
    ];
  }

  void filterOrder() {
    filterorders = orders
        .where((order) =>
            order.OrderID.toString().contains(ordersearchController.text) ||
            order.PharmacyNumber.toString()
                .contains(ordersearchController.text))
        .toList();
    update();
  }
}
