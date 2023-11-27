import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/controllers/medicine_controller.dart';

class MedicinesTable extends StatelessWidget {
  const MedicinesTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicineController>(
      init: MedicineController(),
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
              label: MyCell('the scientific name'.tr),
            ),
            DataColumn(
              label: MyCell('trade name'.tr),
            ),
            DataColumn(
              label: MyCell('category'.tr),
            ),
            DataColumn(
              label: MyCell('the manufacture company'.tr),
            ),
            DataColumn(
              label: MyCell('quantity'.tr),
            ),
            DataColumn(
              label: MyCell('expiration date'.tr),
            ),
            DataColumn(
              label: MyCell('the price'.tr),
            ),
            DataColumn(
              label: MyCell('edit'.tr),
            ),
            DataColumn(
              label: MyCell('delete'.tr),
            ),
          ],
          rows: controller.filteredMedicines
              .map(
                (medicine) => DataRow(
                  cells: [
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
                          icon: Tooltip(
                            message: 'edit'.tr,
                            child: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Tooltip(
                            message: 'delete'.tr,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.black,
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
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
