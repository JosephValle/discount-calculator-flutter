class DiscountModel {
  final String id;
  final double priceBeforeDiscount;
  final double discountedPrice;
  final DateTime date;
  final String description;

  double get discountPercentage =>
      (priceBeforeDiscount - discountedPrice) / priceBeforeDiscount * 100;

  double get amountSaved => priceBeforeDiscount - discountedPrice;

  DiscountModel({
    required this.id,
    required this.priceBeforeDiscount,
    required this.date,
    required this.description,
    required this.discountedPrice,
  });

  // to map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "priceBeforeDiscount": priceBeforeDiscount,
      "discountedPrice": discountedPrice,
      "date": date.toIso8601String(),
      "description": description,
    };
  }

  // from map
  factory DiscountModel.fromMap(Map<String, dynamic> map) {
    return DiscountModel(
      id: map["id"],
      priceBeforeDiscount: map["priceBeforeDiscount"],
      discountedPrice: map["discountedPrice"],
      date: DateTime.parse(map["date"]),
      description: map["description"],
    );
  }

  // copy with
  DiscountModel copyWith({
    String? id,
    double? priceBeforeDiscount,
    double? discountedPrice,
    DateTime? date,
    String? description,
  }) {
    return DiscountModel(
      id: id ?? this.id,
      priceBeforeDiscount: priceBeforeDiscount ?? this.priceBeforeDiscount,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return "DiscountModel(id: $id, priceBeforeDiscount: $priceBeforeDiscount, discountedPrice: $discountedPrice, date: $date, description: $description)";
  }
}
