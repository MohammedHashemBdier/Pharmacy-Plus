import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/constants/images.dart';
import 'package:pharmacy_plus/views/pages/add_medicine_page.dart';
import 'package:pharmacy_plus/views/pages/home_page.dart';
import 'package:pharmacy_plus/views/pages/login_page.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.c1,
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
          message: 'search'.tr,
          child: IconButton(
            onPressed: () => Get.toNamed('medicines'),
            icon: const Icon(
              Icons.search,
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
        Tooltip(
          message: 'add medication'.tr,
          child: IconButton(
            onPressed: () {
              Get.to(const AddMedicinePage());
            },
            icon: const Icon(
              Icons.add,
              color: AppColors.c3,
            ),
          ),
        ),
        Tooltip(
          message: 'want list'.tr,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.list_rounded,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
