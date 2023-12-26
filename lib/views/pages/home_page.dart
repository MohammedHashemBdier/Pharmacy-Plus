import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/constants/images.dart';
import 'package:pharmacy_plus/controllers/medicine_controller.dart';
import 'package:pharmacy_plus/views/pages/login_page.dart';
import 'package:pharmacy_plus/views/pages/order_list_page.dart';
import 'package:pharmacy_plus/views/widgets/medicines_table.dart';
import 'package:pharmacy_plus/views/widgets/my_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static final controller = Get.put(MedicineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.c4,
        centerTitle: true,
        title: Center(
          child: Tooltip(
            message: 'home'.tr,
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 25,
                  ),
                  Text(
                    'فارماسي بلس'.tr,
                    style: const TextStyle(
                      color: AppColors.c3,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Image.asset(
                    AppImages.imagesLogo,
                    width: 50,
                    height: 50,
                  ),
                  const Spacer(
                    flex: 25,
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                  const HomePage(),
                );
              },
            ),
          ),
        ),
        actions: [
          Tooltip(
            message: 'want list'.tr,
            child: IconButton(
              onPressed: () {
                Get.to(
                  const OrderList(),
                );
              },
              icon: const Icon(
                Icons.list_rounded,
                color: AppColors.c3,
              ),
            ),
          ),
          Tooltip(
            message: 'notifications'.tr,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: AppColors.c3,
              ),
            ),
          ),
          Tooltip(
            message: 'change the language'.tr,
            child: IconButton(
              onPressed: () {
                if (Get.locale == const Locale('en')) {
                  Get.updateLocale(const Locale('ar'));
                } else {
                  Get.updateLocale(const Locale('en'));
                }
              },
              icon: const Icon(
                Icons.language_sharp,
                color: AppColors.c3,
              ),
            ),
          ),
        ],
        leading: Tooltip(
          message: 'sign out'.tr,
          child: IconButton(
            onPressed: () {
              showLogoutConfirmationDialog();
            },
            icon: const Icon(
              Icons.power_off_outlined,
              color: AppColors.c3,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      floatingActionButton: Tooltip(
        message: "add medicine".tr,
        child: MaterialButton(
          onPressed: () {
            showAddMedicineDialog(context);
          },
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(height: 100),
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
                        child: TextField(
                          controller: controller.searchController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.search,
                            ),
                            labelText: 'search'.tr,
                            hintText: 'search field'.tr,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: AppColors.c2,
                              ),
                            ),
                          ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                            'previous'.tr,
                            style: const TextStyle(
                              color: AppColors.c3,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      Container(
                        alignment: Alignment.bottomLeft,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showLogoutConfirmationDialog() {
  Get.defaultDialog(
    title: 'confirmation'.tr,
    middleText: 'logout_confirmation_message'.tr,
    backgroundColor: Colors.white,
    textConfirm: 'confirm'.tr,
    buttonColor: AppColors.c2,
    textCancel: 'cancel'.tr,
    confirmTextColor: AppColors.c3,
    cancelTextColor: AppColors.c2,
    onConfirm: () {
      Get.off(() => const LoginPage());
    },
  );
}

void showAddMedicineDialog(BuildContext context) {
  void showAddMedicineConfirmationDialog() {
    Get.defaultDialog(
      title: 'confirmation'.tr,
      middleText: 'AddMedicin_confirmation_message'.tr,
      backgroundColor: Colors.white,
      textConfirm: 'confirm'.tr,
      buttonColor: AppColors.c2,
      textCancel: 'cancel'.tr,
      confirmTextColor: AppColors.c3,
      cancelTextColor: AppColors.c2,
      onConfirm: () {
        Get.back();
      },
    );
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      // إذا تم اختيار تاريخ، قم بتحديث القيمة في الحقل
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text("add medicine".tr)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 400,
                height: 75,
                child: MyTextField(
                  height: 40,
                  width: 370,
                  hint: 'the scientific name'.tr.tr,
                ),
              ),
              SizedBox(
                width: 400,
                height: 75,
                child: MyTextField(
                  height: 40,
                  width: 370,
                  hint: 'trade name'.tr,
                ),
              ),
              SizedBox(
                width: 400,
                height: 75,
                child: MyTextField(
                  height: 40,
                  width: 370,
                  hint: 'category'.tr,
                ),
              ),
              SizedBox(
                width: 400,
                height: 75,
                child: MyTextField(
                  height: 40,
                  width: 370,
                  hint: 'the manufacture company'.tr,
                ),
              ),
              SizedBox(
                width: 400,
                height: 75,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter a value'.tr;
                    }
                    if (int.tryParse(value) == null) {
                      return 'value must contain numbers only'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusColor: AppColors.c2,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    label: Text(
                      'quantity'.tr,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: AppColors.c2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 75,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter a value'.tr;
                    }
                    if (int.tryParse(value) == null) {
                      return 'value must contain numbers only'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusColor: AppColors.c2,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    label: Text(
                      'the price'.tr,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: AppColors.c2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 75,
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  readOnly: true,
                  decoration: InputDecoration(
                    focusColor: AppColors.c2,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                    label: Text(
                      'expiration date'.tr,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: AppColors.c2,
                      ),
                    ),
                  ),
                  onTap: () {
                    selectDate(context);
                  },
                ),
              ),
              SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        showAddMedicineConfirmationDialog();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.c2,
                        ),
                      ),
                      child: Text(
                        'add medication'.tr,
                        style: const TextStyle(
                          color: AppColors.c3,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
