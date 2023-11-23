import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/constants/images.dart';
import 'package:pharmacy_plus/views/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();
  bool isPasswordIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Tooltip(
                  message: 'change the language'.tr,
                  child: IconButton(
                    onPressed: () {
                      // تغيير اللغة عند الضغط على زر تغيير اللغة
                      if (Get.locale == const Locale('en')) {
                        Get.updateLocale(const Locale('ar'));
                      } else {
                        Get.updateLocale(const Locale('en'));
                      }
                    },
                    icon: const Icon(
                      Icons.language_sharp,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Image.asset(
                AppImages.imagesLogo,
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
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  // نص توجيه المستخدم لإدخال كلمة المرور
                  'enter the password'.tr,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              TextField(
                decoration: InputDecoration(
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
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  labelText: 'username'.tr,
                  hintText: 'enter the username'.tr,
                  errorText:
                      isPasswordIncorrect ? 'password is incorrect'.tr : null,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
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
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // استدعاء تابع تسجيل الدخول
                  login();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    AppColors.c2,
                  ),
                ),
                child: Text(
                  'login'.tr,
                  style: TextStyle(
                    color: AppColors.c3,
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
                  Get.off(const HomePage());
                },
                child: Text(
                  'ok'.tr,
                  style: TextStyle(
                    color: AppColors.c2,
                  ),
                ),
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
                child: Text(
                  'ok'.tr,
                  style: TextStyle(
                    color: AppColors.c2,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
