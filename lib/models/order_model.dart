class OrderModel {
  final int? OrderID;
  final int? PharmacyNumber;
  final int? Quantity;
  final DateTime? OrderDate;
  final double? Price;
  final String? status;
  final String? paymentstatus;

  OrderModel({
    this.OrderID,
    this.PharmacyNumber,
    this.Quantity,
    this.OrderDate,
    this.Price,
    this.status,
    this.paymentstatus
  });
}
