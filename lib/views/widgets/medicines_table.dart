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
            .map((medicine) => Row(
                  children: [
                    MyCell(medicine.scientificName!),
                    MyCell(medicine.commercialName!),
                    MyCell(medicine.category!),
                    MyCell(medicine.manufacturer!),
                    MyCell(medicine.quantity!.toString()),
                    MyCell(medicine.expiryDate!.toString()),
                    MyCell(medicine.price!.toString()),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ))
            .toList(),
      ]),
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
