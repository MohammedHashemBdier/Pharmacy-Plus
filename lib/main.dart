import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/lang/app_translation.dart';
import 'package:pharmacy_plus/views/pages/login_page.dart';

void main() {
  runApp(const PharmacyPlus());
}

class PharmacyPlus extends StatelessWidget {
  const PharmacyPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LoginPage(),
      title: 'فارماسي بلس'.tr,
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: AppTranslation.fallbackLocale,
      fallbackLocale: AppTranslation.fallbackLocale,
      theme: ThemeData(
        fontFamily: 'ElMessiri',
        primarySwatch: Colors.blue,
        dataTableTheme: const DataTableThemeData(
          dataTextStyle: TextStyle(fontSize: 16),
          headingTextStyle: TextStyle(
              color: AppColors.c3, fontSize: 18, fontWeight: FontWeight.bold),
          dividerThickness: 0,
          horizontalMargin: 10,
          columnSpacing: 5,
          headingRowHeight: 70,
        ),
      ),
    );
  }
}
