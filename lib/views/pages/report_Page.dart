import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/views/widgets/report_item.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          actions: [
            Tooltip(
              message: 'change the language'.tr,
              child: PhysicalModel(
                color: const Color.fromARGB(0, 255, 255, 255),
                elevation: 1,
                shadowColor: AppColors.c2,
                borderRadius: BorderRadius.circular(10),
                child: IconButton(
                  onPressed: () {
                    // تغيير اللغة عند الضغط على زر تغيير اللغة
                    if (Get.locale == const Locale('en')) {
                      Get.updateLocale(const Locale('ar'));
                    } else {
                      Get.updateLocale(const Locale('en'));
                    }
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.language,
                    color: AppColors.c3,
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
          ],
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          elevation: 0,
          leading: Row(
            children: [
              const SizedBox(
                width: 10,
                height: 10,
              ),
              Tooltip(
                message: 'back'.tr,
                child: PhysicalModel(
                  color: const Color.fromARGB(0, 255, 255, 255),
                  elevation: 1,
                  shadowColor: AppColors.c2,
                  borderRadius: BorderRadius.circular(10),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.c3,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const YourContentWidget(),
    );
  }
}

class YourContentWidget extends StatelessWidget {
  const YourContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.c6, Color.fromARGB(0, 255, 255, 255)],
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(0, 255, 255, 255), AppColors.c6],
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReportItem(title: 'Total Sales'.tr, value: '\$100,000'),
                      ReportItem(title: 'Number of Orders'.tr, value: '50'),
                      ReportItem(
                        title: 'All Orders'.tr,
                        value: 'View All'.tr,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(
                                    'All Orders'.tr,
                                    style: const TextStyle(
                                      color: AppColors.c4,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                content: const SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 500,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ReportItem(
                        title: 'Top 6 Selling Medicines'.tr,
                        value: 'View All'.tr,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(
                                    'Top 6 Selling Medicines'.tr,
                                    style: const TextStyle(
                                      color: AppColors.c4,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                content: const SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 500,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ReportItem(
                        title: 'Top 6 Searched Medicines'.tr,
                        value: 'View All'.tr,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(
                                    'Top 6 Searched Medicines'.tr,
                                    style: const TextStyle(
                                      color: AppColors.c4,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                content: const SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 500,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
