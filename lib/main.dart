import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/lang/app_translation.dart';
import 'package:pharmacy_plus/views/pages/login_page.dart';
import 'package:pharmacy_plus/views/pages/medicines_table_page.dart';

void main() {
  runApp(const PharmacyPlus());
}

class PharmacyPlus extends StatelessWidget {
  const PharmacyPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MedicinesTablePage(),
      title: 'فارماسي بلس'.tr,
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: AppTranslation.fallbackLocale,
      fallbackLocale: AppTranslation.fallbackLocale,
      theme: ThemeData(fontFamily: 'Baloo'),
    );
  }
}
