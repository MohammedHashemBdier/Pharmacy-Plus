import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/App_Colors.dart';
import 'package:pharmacy_plus/constants/App_Images.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController passwordController = TextEditingController();
  bool isPasswordIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Tooltip(
          message: 'change the language'.tr,
          child: IconButton(
            onPressed: () {
              // تغيير اللغة عند الضغط على زر تغيير اللغة
              if (Get.locale == Locale('en')) {
                Get.updateLocale(Locale('ar'));
              } else {
                Get.updateLocale(Locale('en'));
              }
            },
            icon: Icon(
              Icons.language_sharp,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                app_Images.imagesLogo,
                width: 300,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                ),
                child: Text(
                  // عرض اسم التطبيق
                  'فارماسي بلس'.tr,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  // نص توجيه المستخدم لإدخال كلمة المرور
                  'enter the password'.tr,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: app_Colors.c2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  labelText: 'password'.tr,
                  hintText: 'enter the password'.tr,
                  errorText:
                      isPasswordIncorrect ? 'password is incorrect'.tr : null,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // استدعاء تابع تسجيل الدخول
                  login();
                },
                child: Text('login'.tr),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    app_Colors.c2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // تابع التحقق من صحة كلمة المرور
  void login() {
    if (passwordController.text == '1234') {
      setState(() {
        isPasswordIncorrect = false;
      });

      // إظهار الرسالة عند نجاح تسجيل الدخول
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('log in successful'.tr),
            content: Text('Welcome!'.tr),
            actions: [
              TextButton(
                onPressed: () {
                  Get.off(Home());
                },
                child: Text('ok'.tr),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        isPasswordIncorrect = true;
      });

      // إظهار رسالة الخطأ عند فشل تسجيل الدخول
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('login error'.tr),
            content: Text('password incorrect'.tr),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('ok'.tr),
              ),
            ],
          );
        },
      );
    }
  }
}
