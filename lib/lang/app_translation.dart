import 'dart:ui';
import 'package:get/get.dart';

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
          'the scientific name': 'Scientific Name',
          "trade name": 'Commercial Name',
          'category': 'Category',
          'the manufacture company': 'Manufacturer',
          'quantity': 'Quantity Available',
          'please enter a value': 'Please enter a value',
          'value must contain numbers only': 'Value must contain numbers only',
          'expiration date': 'Expiry Date',
          'the price': 'Price',
          'search field': 'Filter by Medicine Name or Category',
          'medicines title': 'Medicines',
          'add medicine': 'Add Medicine',
          'edit': 'Edit',
          'delete': 'Delete',
          'next': 'Next',
          'report': 'Report',
          'OrderID': 'Order ID',
          'PharmacyNumber': 'Pharmacy Number',
          'OrderDate': 'Order Date',
          'Orders': 'Orders',
          'search field 2': 'Filter by Order ID or Pharmacy Number',
          'details': 'Details',
          'quantity2': 'Quantity',
          "change status": 'Change Status',
          "status": 'Status',
          'preparing': 'Preparing',
          'sent': 'Sent',
          'received': 'Received',
          'change medication': 'Change Medication',
          'change_confirmation_message':
              'Do you really want to Change Medication?',
          'payment status': 'Payment Status',
          'previous': 'Previous',
          'delete_confirmation_message':
              'Do you really want to Delet Medication?',
          'paid': 'Paid',
          'unpaid': 'Unpaid',
          'AddMedicin_confirmation_message': 'Do you want to add medication?',
          'from': 'From',
          'to': 'To',
          "show": 'Show',
          'Total Sales': 'Total Sales',
          'Number of Orders': 'Number of Orders',
          'Top 6 Selling Medicines': 'Top 6 Selling Medicines',
          'View All': 'View All',
          'Top 6 Searched Medicines': 'Top 6 Searched Medicines',
          'All Orders': 'All Orders',
          'back': 'Back',
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
          'logout_confirmation_message': 'هل تريد حقا تسجيل الخروج؟',
          'confirm': 'تاكيد',
          'cancel': 'الغاء',
          'the scientific name': 'الاسم العلمي',
          "trade name": 'الاسم التجاري',
          'category': 'التصنيف',
          'the manufacture company': 'الشركة المصنعة',
          'quantity': 'الكمية المتوفرة',
          'please enter a value': 'يرجى إدخال قيمة',
          'value must contain numbers only':
              'يجب أن تحتوي القيمة على أرقام فقط',
          'expiration date': 'تاريخ إنتهاء الصلاحية',
          'the price': 'السعر',
          'search field': 'تصفية حسب اسم الدواء أو التصنيف',
          'medicines title': 'الأدوية',
          'add medicine': 'إضافة دواء',
          'edit': 'تعديل',
          'delete': 'حذف',
          'next': 'التالي',
          'report': 'تقرير',
          'OrderID': 'رقم الطلب',
          'PharmacyNumber': 'رقم الصيدلية',
          'OrderDate': 'تاريخ الطلب',
          'Orders': 'الطلبات',
          'search field 2': 'تصفية حسب رقم الطلب أو رقم الصيدلية',
          'details': 'تفاصيل',
          'quantity2': 'الكمية',
          "change status": 'تغيير الحالة',
          "status": 'الحالة',
          'preparing': 'قيد التحضير',
          'sent': 'مرسلة',
          'received': 'مستلمة',
          'change medication': 'تعديل الدواء',
          'change_confirmation_message': 'هل تريد حقا تعديل الدواء؟',
          'payment status': 'حالة الدفع',
          'previous': 'السابق',
          'delete_confirmation_message': 'هل تريد حقا حذف الدواء؟',
          'paid': 'مدفوع',
          'unpaid': 'غير مدفوع',
          'AddMedicin_confirmation_message': 'هل تريد إضافة الدواء؟',
          'from': 'من',
          'to': 'الى',
          "show": 'اعرض',
          'Total Sales': 'مجموع المبيعات',
          'Number of Orders': 'عدد الطلبات',
          'Top 6 Selling Medicines': 'اكثر 6 ادوية مبيعاً',
          'View All': 'اظهر الكل',
          'Top 6 Searched Medicines': 'اكثر 6 ادوية بحثاً',
          'All Orders': 'كل المبيعات',
          'back': 'رجوع',
        },
      };
}
