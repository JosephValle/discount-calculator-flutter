class DiscountModel {
  // Storage Items
  final String id;
  final double priceBeforeDiscount;
  final double discount;
  final bool fixedDiscount;
  final DateTime date;
  final String description;

  // Getters
  double get savings =>
      fixedDiscount ? discount : priceBeforeDiscount * discount;

  double get discountedPrice => priceBeforeDiscount - savings;

  DiscountModel({
    required this.id,
    required this.priceBeforeDiscount,
    required this.discount,
    required this.fixedDiscount,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "priceBeforeDiscount": priceBeforeDiscount,
      "discount": discount,
      "fixedDiscount": fixedDiscount,
      "date": date,
      "description": description,
    };
  }

  factory DiscountModel.fromMap(Map<String, dynamic> map) {
    return DiscountModel(
      id: map["id"] as String,
      priceBeforeDiscount: map["priceBeforeDiscount"] as double,
      discount: map["discount"] as double,
      fixedDiscount: map["fixedDiscount"] as bool,
      date: map["date"] as DateTime,
      description: map["description"] as String,
    );
  }
}
