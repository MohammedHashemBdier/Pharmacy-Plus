import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/colors.dart';
import 'package:pharmacy_plus/constants/images.dart';
import 'package:pharmacy_plus/views/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();
  bool isPasswordIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Loginbackground_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.c5, Color.fromARGB(0, 255, 255, 255)],
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(0, 255, 255, 255), AppColors.c5],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Tooltip(
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppImages.imagesLogo,
                                    width: 300,
                                    height: 300,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 25),
                                    child: PhysicalModel(
                                      color: const Color.fromARGB(
                                          0, 255, 255, 255),
                                      elevation: 20,
                                      shadowColor:
                                          AppColors.c2.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(20),
                                      child: Text(
                                        // عرض اسم التطبيق
                                        'فارماسي بلس'.tr,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            const SizedBox(
                              height: 500,
                              child: Align(
                                alignment: Alignment.center,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.c3,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.c1,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.c1.withOpacity(1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text(
                                          // نص توجيه المستخدم لإدخال كلمة المرور
                                          'enter the password'.tr,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      SizedBox(
                                        width: 300,
                                        height: 100,
                                        child: TextField(
                                          controller: passwordController,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                color: AppColors.c2,
                                              ),
                                            ),
                                            errorBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            labelText: 'password'.tr,
                                            hintText: 'enter the password'.tr,
                                            errorText: isPasswordIncorrect
                                                ? 'password is incorrect'.tr
                                                : null,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      PhysicalModel(
                                        color: const Color.fromARGB(
                                            0, 255, 255, 255),
                                        elevation: 10,
                                        shadowColor: AppColors.c2,
                                        borderRadius: BorderRadius.circular(20),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // استدعاء تابع تسجيل الدخول
                                            login();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              AppColors.c2,
                                            ),
                                          ),
                                          child: PhysicalModel(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255),
                                            elevation: 10,
                                            shadowColor: AppColors.c2,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Text(
                                              'login'.tr,
                                              style: const TextStyle(
                                                color: AppColors.c3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // تابع التحقق من صحة كلمة المرور
  void login() {
    if (passwordController.text == '1234') {
      setState(() {
        isPasswordIncorrect = false;
        Get.off(const HomePage());
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
                  Navigator.of(context).pop();
                },
                child: Text(
                  'ok'.tr,
                  style: const TextStyle(
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
                  style: const TextStyle(
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
