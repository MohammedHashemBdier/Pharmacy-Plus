import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/controllers/medicine_controller.dart';
import 'package:pharmacy_plus/views/pages/add_medicine_page.dart';
import 'package:pharmacy_plus/views/widgets/medicines_table.dart';
import 'package:pharmacy_plus/views/widgets/my_app_bar.dart';
import 'package:pharmacy_plus/views/widgets/my_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static final controller = Get.put(MedicineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Tooltip(
            message: "add medicine".tr,
            child: MaterialButton(
              onPressed: () => Get.to(() => const AddMedicinePage()),
              color: AppColors.c2,
              elevation: 4,
              height: 50,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  FittedBox(
                    child: Text(
                      'medicines title'.tr,
                      style: const TextStyle(
                        color: AppColors.c2,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(flex: 5),
                  Expanded(
                    flex: 5,
                    child: MyTextField(
                      height: 16,
                      hint: 'search field'.tr,
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                      controller: controller.searchController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const SizedBox(
                width: 5000,
                child: MedicinesTable(),
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.c2,
                    ),
                  ),
                  child: Text(
                    'next'.tr,
                    style: const TextStyle(
                      color: AppColors.c3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
