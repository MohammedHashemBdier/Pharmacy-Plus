import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/controllers/medicine_controller.dart';

class MedicinesTable extends StatelessWidget {
  const MedicinesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicineController>(
      init: MedicineController(),
      builder: (controller) => Column(children: [
        Row(
          children: [
            MyCell('the scientific name'.tr),
            MyCell('trade name'.tr),
            MyCell('category'.tr),
            MyCell('the manufacture company'.tr),
            MyCell('quantity'.tr),
            MyCell('expiration date'.tr),
            MyCell('the price'.tr),
          ],
        ),
        ...controller.filteredMedicines
            .map((medicine) => InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      MyCell(medicine.scientificName!),
                      MyCell(medicine.commercialName!),
                      MyCell(medicine.category!),
                      MyCell(medicine.manufacturer!),
                      MyCell(medicine.quantity!.toString()),
                      MyCell(medicine.expiryDate!.toString()),
                      MyCell(medicine.price!.toString()),
                    ],
                  ),
                ))
            .toList(),
      ]),
      // DataTable(
      //   columnSpacing: 0,
      //   columns: [
      //     DataColumn(
      //       label: Expanded(
      //         child: MyCell('the scientific name'.tr),
      //       ),
      //     ),
      //     DataColumn(
      //       label: Expanded(
      //         child: MyCell('trade name'.tr),
      //       ),
      //     ),
      //     DataColumn(
      //       label: Expanded(
      //         child: MyCell('category'.tr),
      //       ),
      //     ),
      //     DataColumn(
      //       label: Expanded(
      //         child: MyCell('the manufacture company'.tr),
      //       ),
      //     ),
      //     DataColumn(
      //       label: Expanded(
      //         child: MyCell('quantity'.tr),
      //       ),
      //     ),
      //     DataColumn(
      //       label: Expanded(
      //         child: MyCell('expiration date'.tr),
      //       ),
      //     ),
      //     DataColumn(
      //       label: Expanded(
      //         child: MyCell('the price'.tr),
      //       ),
      //     ),
      //   ],
      //   rows: controller.filteredMedicines
      //       .map((medicine) => DataRow(cells: [
      //             DataCell(MyCell(medicine.scientificName!)),
      //             DataCell(MyCell(medicine.commercialName!)),
      //             DataCell(MyCell(medicine.category!)),
      //             DataCell(MyCell(medicine.manufacturer!)),
      //             DataCell(MyCell(medicine.quantity!.toString())),
      //             DataCell(MyCell(medicine.expiryDate!.toString())),
      //             DataCell(MyCell(medicine.price!.toString())),
      //           ]))
      //       .toList(),
      // ),
    );
  }
}

class MyCell extends StatelessWidget {
  final String text;

  const MyCell(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: FittedBox(
          child: Text(
            text,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
