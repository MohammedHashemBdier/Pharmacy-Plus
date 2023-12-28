import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/controllers/order_controller.dart';

enum OrderStatus {
  preparing,
  sent,
  received,
}

enum PaymentStatus {
  paid,
  unpaid,
}

class OrderTable extends StatelessWidget {
  const OrderTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderStatus ordercurrentStatus = OrderStatus.preparing;
    PaymentStatus paymentcurrentStatus = PaymentStatus.paid;

    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.c5,
              Color.fromARGB(0, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SlideInTable(
          dataTable: DataTable(
            dividerThickness: 0,
            border: TableBorder.all(
              width: 50,
              color: Colors.transparent,
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
                label: MyCell('payment status'.tr),
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
                      // DataCell(MyCell(order.paymentstatus.toString())),
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
                                          title: Text('paid'.tr),
                                          leading: Radio<PaymentStatus>(
                                            value: PaymentStatus.paid,
                                            groupValue: paymentcurrentStatus,
                                            onChanged: (PaymentStatus? value) {
                                              if (value != null) {
                                                paymentcurrentStatus = value;
                                                Get.back();
                                              }
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text('unpaid'.tr),
                                          leading: Radio<PaymentStatus>(
                                            value: PaymentStatus.unpaid,
                                            groupValue: paymentcurrentStatus,
                                            onChanged: (PaymentStatus? value) {
                                              if (value != null) {
                                                paymentcurrentStatus = value;
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
                                paymentcurrentStatus.toString().split('.').last,
                                style: const TextStyle(color: Colors.black),
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
                                    title: Text('details'.tr),
                                    content: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [],
                                    ),
                                  );
                                },
                              );
                            },
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
                                    title: Text('change status'.tr),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          title: Text('preparing'.tr),
                                          leading: Radio<OrderStatus>(
                                            value: OrderStatus.preparing,
                                            groupValue: ordercurrentStatus,
                                            onChanged: (OrderStatus? value) {
                                              if (value != null) {
                                                ordercurrentStatus = value;
                                                Get.back();
                                              }
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text('sent'.tr),
                                          leading: Radio<OrderStatus>(
                                            value: OrderStatus.sent,
                                            groupValue: ordercurrentStatus,
                                            onChanged: (OrderStatus? value) {
                                              if (value != null) {
                                                ordercurrentStatus = value;
                                                Get.back();
                                              }
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text('received'.tr),
                                          leading: Radio<OrderStatus>(
                                            value: OrderStatus.received,
                                            groupValue: ordercurrentStatus,
                                            onChanged: (OrderStatus? value) {
                                              if (value != null) {
                                                ordercurrentStatus = value;
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
                                ordercurrentStatus.toString().split('.').last,
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
      ),
    );
  }
}

class SlideInTable extends StatefulWidget {
  final DataTable dataTable;

  const SlideInTable({Key? key, required this.dataTable}) : super(key: key);

  @override
  _SlideInTableState createState() => _SlideInTableState();
}

class _SlideInTableState extends State<SlideInTable>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds : 1500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 500 * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: widget.dataTable,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
