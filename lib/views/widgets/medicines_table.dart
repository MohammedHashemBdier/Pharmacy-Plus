import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/controllers/medicine_controller.dart';

class MedicinesTable extends StatelessWidget {
  const MedicinesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicineController>(
      init: MedicineController(),
      builder: (controller) => DataTable(
        columnSpacing: 0,
        columns: [
          DataColumn(
            label: Expanded(child: MyCell('the scientific name'.tr)),
          ),
          DataColumn(
            label: Expanded(child: MyCell('trade name'.tr)),
          ),
          DataColumn(
            label: Expanded(child: MyCell('category'.tr)),
          ),
          DataColumn(
            label: Expanded(child: MyCell('the manufacture company'.tr)),
          ),
          DataColumn(
            label: Expanded(child: MyCell('quantity'.tr)),
          ),
          DataColumn(
            label: Expanded(child: MyCell('expiration date'.tr)),
          ),
          DataColumn(
            label: Expanded(child: MyCell('the price'.tr)),
          ),
          DataColumn(
            label: Expanded(child: MyCell('edit'.tr)),
          ),
          DataColumn(
            label: Expanded(child: MyCell('delete'.tr)),
          ),
        ],
        rows: controller.filteredMedicines
            .map((medicine) => DataRow(cells: [
                  DataCell(MyCell(medicine.scientificName!)),
                  DataCell(MyCell(medicine.commercialName!)),
                  DataCell(MyCell(medicine.category!)),
                  DataCell(MyCell(medicine.manufacturer!)),
                  DataCell(MyCell(medicine.quantity!.toString())),
                  DataCell(MyCell(medicine.expiryDate!.toString())),
                  DataCell(MyCell(medicine.price!.toString())),
                  DataCell(
                    Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                ]))
            .toList(),
      ),
    );
  }
}

class MyCell extends StatelessWidget {
  final String text;

  const MyCell(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: FittedBox(
        child: Text(text),
      ),
    );
  }
}
