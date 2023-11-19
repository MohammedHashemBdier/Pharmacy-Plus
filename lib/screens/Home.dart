import 'package:flutter/material.dart';
import 'package:pharmacy_plus/constants/App_Bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(),
    );
  }
}
