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
        primaryColor: primary,
        hintColor: AppColors.c2,
        toggleableActiveColor: AppColors.c2,
        focusColor: AppColors.c2,
        cardColor: AppColors.c2,
        primaryColorLight: primary,
        selectedRowColor: AppColors.c2,
      ),
    );
  }
}
