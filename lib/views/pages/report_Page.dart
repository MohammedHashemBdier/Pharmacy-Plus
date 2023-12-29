import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/views/widgets/report_item.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
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
    return Center(
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
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(
                          height: 500,
                        ),
                      ]),
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
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(
                          height: 500,
                        ),
                      ]),
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
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(
                          height: 500,
                        ),
                      ]),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
