import 'package:get/get.dart';

enum OrderStatus {
  preparing,
  sent,
  received,
}

enum PaymentStatus {
  paid,
  unpaid,
}

class TranslationController extends GetxController {
  static TranslationController get to => Get.find();

  String translateOrderStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.preparing:
        return 'preparing'.tr;
      case OrderStatus.sent:
        return 'sent'.tr;
      case OrderStatus.received:
        return 'received'.tr;
      default:
        return '';
    }
  }

  String translatePaymentStatus(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.paid:
        return 'paid'.tr;
      case PaymentStatus.unpaid:
        return 'unpaid'.tr;
      default:
        return '';
    }
  }
}
