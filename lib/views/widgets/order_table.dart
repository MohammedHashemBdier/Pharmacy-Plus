import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/controllers/order_controller.dart';

enum OrderStatus {
  preparing,
  sent,
  received,
}

class OrderTable extends StatelessWidget {
  const OrderTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderStatus currentStatus = OrderStatus.preparing;

    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.c5, AppColors.c3],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: DataTable(
          border: TableBorder.all(
            width: 5,
            color: AppColors.c3,
          ),
          columnSpacing: 0,
          columns: [
            DataColumn(
              label: MyCell('OrderID'.tr),
            ),
            DataColumn(
              label: MyCell('PharmacyNumber'.tr),
            ),
            DataColumn(
              label: MyCell('quantity2'.tr),
            ),
            DataColumn(
              label: MyCell('the price'.tr),
            ),
            DataColumn(
              label: MyCell('OrderDate'.tr),
            ),
            DataColumn(
              label: MyCell('details'.tr),
            ),
            DataColumn(
              label: MyCell("status".tr),
            ),
          ],
          rows: controller.filterorders
              .map(
                (order) => DataRow(
                  cells: [
                    DataCell(MyCell(order.OrderID.toString())),
                    DataCell(MyCell(order.PharmacyNumber.toString())),
                    DataCell(MyCell(order.Quantity.toString())),
                    DataCell(MyCell(order.Price.toString())),
                    DataCell(MyCell(order.OrderDate.toString())),
                    DataCell(
                      Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Tooltip(
                            message: 'details'.tr,
                            child: const Icon(
                              Icons.info,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("change status".tr),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: Text('preparing'.tr),
                                        leading: Radio<OrderStatus>(
                                          value: OrderStatus.preparing,
                                          groupValue: currentStatus,
                                          onChanged: (OrderStatus? value) {
                                            if (value != null) {
                                              currentStatus = value;
                                              Get.back();
                                            }
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('sent'.tr),
                                        leading: Radio<OrderStatus>(
                                          value: OrderStatus.sent,
                                          groupValue: currentStatus,
                                          onChanged: (OrderStatus? value) {
                                            if (value != null) {
                                              currentStatus = value;
                                              Get.back();
                                            }
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('received'.tr),
                                        leading: Radio<OrderStatus>(
                                          value: OrderStatus.received,
                                          groupValue: currentStatus,
                                          onChanged: (OrderStatus? value) {
                                            if (value != null) {
                                              currentStatus = value;
                                              Get.back();
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Tooltip(
                            message: 'change status'.tr,
                            child: Text(
                              currentStatus.toString().split('.').last,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class MyCell extends StatelessWidget {
  final String text;

  const MyCell(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: FittedBox(
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
