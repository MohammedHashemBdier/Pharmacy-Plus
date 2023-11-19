abstract class Medicine {
  String? tradeName;
  String? scientificName;
  String? category;
  String? companyName;
  int? quantity;
  String? expiry;
  int? price;
  Medicine({
    required this.tradeName,
    required this.scientificName,
    required this.category,
    required this.companyName,
    required this.quantity,
    required this.expiry,
    required this.price,
  });
}
