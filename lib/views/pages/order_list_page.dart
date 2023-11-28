import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/constants/images.dart';
import 'package:pharmacy_plus/controllers/order_controller.dart';
import 'package:pharmacy_plus/views/pages/home_page.dart';
import 'package:pharmacy_plus/views/pages/login_page.dart';
import 'package:pharmacy_plus/views/widgets/order_table.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);
  static final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            message: 'report'.tr,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.list_alt_rounded,
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
                      'Orders'.tr,
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
                      controller: controller.ordersearchController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.search,
                        ),
                        labelText: 'search'.tr,
                        hintText: 'search field 2'.tr,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(),
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
                ],
              ),
              const SizedBox(height: 30),
              const SizedBox(
                width: 5000,
                child: OrderTable(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
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
