import 'dart:ui';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslation extends Translations {
  static const fallbackLocale = Locale('ar', 'AR');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'فارماسي بلس': 'Pharmacy Plus',
          'search': 'Search',
          'notifications': 'Notifications',
          'enter the password': 'Enter the password:',
          'password': 'Password',
          'password is incorrect': 'Password is incorrect!',
          'log in successful': 'Sign In Successful',
          'Welcome!': 'Welcome! \nYou have successfully Signed In .',
          'ok': 'Ok',
          'login error': 'Sign In  Error',
          'password incorrect': 'Password is incorrect! \nTry again please',
          'login': 'Sign In ',
          'home': 'Home',
          'change the language': 'Change the Language',
          'add medication': 'Add Medication',
          'want list': 'Order List',
          'sign out': 'Sign Out',
          'confirmation': 'Confirmation!',
          'logout_confirmation_message': 'Do you really want to log out?',
          'confirm': 'Confirm',
          'cancel': 'Cancel',
          'the scientific name': 'The Scientific Name:',
          "trade name": 'Trade Name:',
          'category': 'Category:',
          'the manufacture company': 'The Manufacture Company:',
          'quantity': 'Quantity Available:',
          'please enter a value': 'Please enter a value',
          'value must contain numbers only': 'Value must contain numbers only',
          'expiration date': 'Expiration Date:',
          'the price': 'Price:',
        },
        'ar_AR': {
          'فارماسي بلس': 'فارماسي بلس',
          'search': 'البحث',
          'notifications': 'الإشعارات',
          'enter the password': 'ادخل كلمة المرور:',
          'password': 'كلمة المرور',
          'password is incorrect': 'كلمة المرور غير صحيحة!',
          'log in successful': 'تسجيل الدخول ناجح',
          'Welcome!': 'مرحبًا! \n لقد قمت بتسجيل الدخول بنجاح.',
          'ok': 'موافق',
          'login error': 'خطأ في تسجيل الدخول',
          'password incorrect':
              'كلمة المرور غير صحيحة! \n حاول مرة أخرى من فضلك.',
          'login': 'تسجيل الدخول',
          'home': 'الصفحة الرئيسية',
          'change the language': 'تغيير اللغة',
          'add medication': 'إضافة الدواء',
          'want list': 'قائمة الطلبات',
          'sign out': 'تسجيل خروج',
          'confirmation': 'تاكيد!',
          'logout_confirmation_message': 'هل تريد حقا بتسجيل الخروج؟',
          'confirm': 'تاكيد',
          'cancel': 'الغاء',
          'the scientific name': 'الاسم العلمي:',
          "trade name": 'الاسم التجاري:',
          'category': 'التصنيف:',
          'the manufacture company': 'الشركة المصنعة:',
          'quantity': 'الكمية المتوفرة:',
          'please enter a value': 'يرجى إدخال قيمة',
          'value must contain numbers only':
              'يجب أن تحتوي القيمة على أرقام فقط',
          'expiration date': 'تاريخ إنتهاء الصلاحية:',
          'the price': 'السعر:',
        },
      };
}