class DiscountModel {
  DiscountModel({
    required this.id,
    required this.priceBeforeDiscount,
    required this.date,
    required this.description,
    required this.discountedPrice,
  });

  // from map
  factory DiscountModel.fromMap(Map<String, dynamic> map) => DiscountModel(
        id: map['id'] as String,
        priceBeforeDiscount: map['priceBeforeDiscount'] as double,
        discountedPrice: map['discountedPrice'] as double,
        date: DateTime.parse(map['date'] as String),
        description: map['description'] as String,
      );
  final String id;
  final double priceBeforeDiscount;
  final double discountedPrice;
  final DateTime date;
  final String description;

  double get discountPercentage =>
      (priceBeforeDiscount - discountedPrice) / priceBeforeDiscount * 100;

  double get amountSaved => priceBeforeDiscount - discountedPrice;

  // to map
  Map<String, dynamic> toMap() => {
        'id': id,
        'priceBeforeDiscount': priceBeforeDiscount,
        'discountedPrice': discountedPrice,
        'date': date.toIso8601String(),
        'description': description,
      };

  // copy with
  DiscountModel copyWith({
    String? id,
    double? priceBeforeDiscount,
    double? discountedPrice,
    DateTime? date,
    String? description,
  }) =>
      DiscountModel(
        id: id ?? this.id,
        priceBeforeDiscount: priceBeforeDiscount ?? this.priceBeforeDiscount,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        date: date ?? this.date,
        description: description ?? this.description,
      );
}
