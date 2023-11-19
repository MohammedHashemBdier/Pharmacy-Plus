// medicine.dart

class Medicine {
  final int id;
  final String scientificName;
  final String commercialName;
  final String category;
  final String manufacturer;
  final int quantity;
  final DateTime expiryDate;
  final double price;

  Medicine({
    required this.id,
    required this.scientificName,
    required this.commercialName,
    required this.category,
    required this.manufacturer,
    required this.quantity,
    required this.expiryDate,
    required this.price,
  });
}
