import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/lang/AppTranslation.dart';
import 'package:pharmacy_plus/screens/Login.dart';

void main() {
  runApp(
    Pharmacy_Plus(),
  );
}

class Pharmacy_Plus extends StatelessWidget {
  const Pharmacy_Plus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'فارماسي بلس'.tr,
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: AppTranslation.fallbackLocale,
      fallbackLocale: AppTranslation.fallbackLocale,
      home: Login(),
    );
  }
}
