class DiscountModel {
  final String id;
  final double priceBeforeDiscount;
  final double discount;
  final bool fixedDiscount;
  final DateTime date;
  final String description;

  double get savings =>
      fixedDiscount ? discount : priceBeforeDiscount * (discount / 100);

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
      "fixedDiscount": fixedDiscount ? 1 : 0, // Convert bool to int
      "date": date.toIso8601String(), // Convert DateTime to String
      "description": description,
    };
  }

  factory DiscountModel.fromMap(Map<String, dynamic> map) {
    return DiscountModel(
      id: map["id"] as String,
      priceBeforeDiscount: map["priceBeforeDiscount"] as double,
      discount: map["discount"] as double,
      fixedDiscount: (map["fixedDiscount"] as int) == 1, // Convert int to bool
      date: DateTime.parse(map["date"] as String), // Parse String to DateTime
      description: map["description"] as String,
    );
  }

  DiscountModel copyWith({
    String? id,
    double? priceBeforeDiscount,
    double? discount,
    bool? fixedDiscount,
    DateTime? date,
    String? description,
  }) {
    return DiscountModel(
      id: id ?? this.id,
      priceBeforeDiscount: priceBeforeDiscount ?? this.priceBeforeDiscount,
      discount: discount ?? this.discount,
      fixedDiscount: fixedDiscount ?? this.fixedDiscount,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return "DiscountModel(id: $id, priceBeforeDiscount: $priceBeforeDiscount, discount: $discount, fixedDiscount: $fixedDiscount, date: $date, description: $description)";
  }
}
