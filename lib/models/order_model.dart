class OrderModel {
  final int? OrderID;
  final int? PharmacyNumber;
  final int? Quantity;
  final DateTime? OrderDate;
  final double? Price;

  OrderModel({
    this.OrderID,
    this.PharmacyNumber,
    this.Quantity,
    this.OrderDate,
    this.Price,
  });
}
