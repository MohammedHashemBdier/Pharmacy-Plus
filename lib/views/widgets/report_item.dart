import 'package:flutter/material.dart';
import 'package:pharmacy_plus/constants/colors.dart';

class ReportItem extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;

  const ReportItem(
      {required this.title, required this.value, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, color: AppColors.c2),
            ),
          ],
        ),
      ),
    );
  }
}
