import "package:discount_calculator/models/discount_model.dart";
import "package:flutter/cupertino.dart";

class HistoryTile extends StatelessWidget {
  final DiscountModel discount;

  const HistoryTile({required this.discount, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(discount.id),
    );
  }
}
