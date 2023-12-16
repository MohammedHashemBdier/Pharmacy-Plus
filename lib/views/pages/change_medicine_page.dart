import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/views/pages/home_page.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/views/widgets/my_text_field.dart';

class ChangeMedicinePage extends StatelessWidget {
  const ChangeMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: MyTextField(
                      height: 40,
                      width: 370,
                      hint: 'the scientific name'.tr,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: MyTextField(
                      height: 40,
                      width: 370,
                      hint: 'trade name'.tr,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: MyTextField(
                      height: 40,
                      width: 370,
                      hint: 'category'.tr,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: MyTextField(
                      height: 40,
                      width: 370,
                      hint: 'the manufacture company'.tr,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: SizedBox(
                      width: 200,
                      height: 50,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: SizedBox(
                      width: 240,
                      height: 50,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: SizedBox(
                      width: 280,
                      height: 50,
                      child: TextFormField(
                        textDirection: TextDirection.rtl,
                        readOnly: true,
                        decoration: InputDecoration(
                          focusColor: AppColors.c2,
                          suffixIcon: const Icon(Icons.calendar_today),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 120,
                            horizontal: 20,
                          ),
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
                          _selectDate(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showLogoutConfirmationDialog();
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
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.off(const HomePage());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.c2,
                      ),
                    ),
                    child: Text(
                      'cancel'.tr,
                      style: const TextStyle(
                        color: AppColors.c3,
                        fontSize: 20,
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
  }
}

Future<void> _selectDate(BuildContext context) async {
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

void showLogoutConfirmationDialog() {
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
      Get.off(() => const HomePage());
    },
  );
}
