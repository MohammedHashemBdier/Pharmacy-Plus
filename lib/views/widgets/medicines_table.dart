import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/controllers/medicine_controller.dart';
import 'package:pharmacy_plus/views/widgets/my_text_field.dart';

class MedicinesTable extends StatelessWidget {
  const MedicinesTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicineController>(
      init: MedicineController(),
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
                            onPressed: () {
                              showChangeMedicineDialog(context);
                            },
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
                            onPressed: () {
                              showDeletetConfirmationDialog();
                            },
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
      duration: const Duration(milliseconds: 1500),
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

void showDeletetConfirmationDialog() {
  Get.defaultDialog(
    title: 'confirmation'.tr,
    middleText: 'change_confirmation_message'.tr,
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

void showChangeMedicineDialog(BuildContext context) {
  void showChangeMedicineConfirmationDialog() {
    Get.defaultDialog(
      title: 'confirmation'.tr,
      middleText: 'change_confirmation_message'.tr,
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
        title: Center(
            child: Text(
          'change medication'.tr,
        )),
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
                        showChangeMedicineConfirmationDialog();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.c2,
                        ),
                      ),
                      child: Text(
                        'change medication'.tr,
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
