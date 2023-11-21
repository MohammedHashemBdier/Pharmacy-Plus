import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/controllers/medicine_controller.dart';
import 'package:pharmacy_plus/views/pages/add_medicine_page.dart';
import 'package:pharmacy_plus/views/widgets/medicines_table.dart';
import 'package:pharmacy_plus/views/widgets/my_app_bar.dart';
import 'package:pharmacy_plus/views/widgets/my_text_field.dart';

class MedicinesTablePage extends StatelessWidget {
  const MedicinesTablePage({super.key});

  static final controller = Get.put(MedicineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      floatingActionButton: MaterialButton(
        onPressed: () => Get.to(() => const AddMedicinePage()),
        color: Colors.blue,
        elevation: 4,
        height: 70,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    child: Text(
                      'medicines title'.tr,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 5),
                Expanded(
                  flex: 5,
                  child: MyTextField(
                    height: 16,
                    fontSize: 14,
                    hint: 'search field'.tr,
                    suffixIcon: const Icon(Icons.search),
                    controller: controller.searchController,
                  ),
                ),
              ],
            ),
            const MedicinesTable(),
          ],
        ),
      ),
    );
  }
}
