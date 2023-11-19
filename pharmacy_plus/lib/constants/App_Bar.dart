import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/App_Colors.dart';
import 'package:pharmacy_plus/constants/App_Images.dart';
import 'package:pharmacy_plus/screens/Add_Medicine.dart';
import 'package:pharmacy_plus/screens/Home.dart';
import 'package:pharmacy_plus/screens/Login.dart';

class MyAppBar extends AppBar {
  // تعريف الـ AppBar المشترك
  MyAppBar()
      : super(
          backgroundColor: app_Colors.c1,
          centerTitle: true,
          title: Center(
            child: Tooltip(
              message: 'home'.tr,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 25,
                    ),
                    Text(
                      'فارماسي بلس'.tr,
                      style: TextStyle(
                        color: app_Colors.c3,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Image.asset(
                      app_Images.imagesLogo,
                      width: 50,
                      height: 50,
                    ),
                    Spacer(
                      flex: 25,
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(
                    Home(),
                  );
                },
              ),
            ),
          ),
          actions: [
            Tooltip(
              message: 'search'.tr,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: app_Colors.c3,
                ),
              ),
            ),
            Tooltip(
              message: 'notifications'.tr,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: app_Colors.c3,
                ),
              ),
            ),
            Tooltip(
              message: 'change the language'.tr,
              child: IconButton(
                onPressed: () {
                  if (Get.locale == Locale('en')) {
                    Get.updateLocale(Locale('ar'));
                  } else {
                    Get.updateLocale(Locale('en'));
                  }
                },
                icon: Icon(
                  Icons.language_sharp,
                  color: app_Colors.c3,
                ),
              ),
            ),
            Tooltip(
              message: 'add medication'.tr,
              child: IconButton(
                onPressed: () {
                  Get.to(AddMedicine());
                },
                icon: Icon(
                  Icons.add,
                  color: app_Colors.c3,
                ),
              ),
            ),
            Tooltip(
              message: 'want list'.tr,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.list_rounded,
                  color: app_Colors.c3,
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
              icon: Icon(
                Icons.power_off_outlined,
                color: app_Colors.c3,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        );
}

void showLogoutConfirmationDialog() {
  Get.defaultDialog(
    title: 'confirmation'.tr,
    middleText: 'logout_confirmation_message'.tr,
    textConfirm: 'confirm'.tr,
    buttonColor: app_Colors.c2,
    textCancel: 'cancel'.tr,
    confirmTextColor: app_Colors.c3,
    cancelTextColor: app_Colors.c2,
    onConfirm: () {
      Get.off(() => Login());
    },
  );
}
