import "package:discount_calculator/models/discount_model.dart";
import "package:discount_calculator/user_interface/widgets/info_widget.dart";
import "package:discount_calculator/utilities/extensions/date_time_extensions.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_slidable/flutter_slidable.dart";

import "../../logical_interface/bloc/history_bloc.dart";
import "description_dialog.dart";

class HistoryTile extends StatelessWidget {
  final DiscountModel discount;

  const HistoryTile({required this.discount, super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => showDialog(
              context: context,
              builder: (context) => DescriptionDialog(discountModel: discount),
            ),
            icon: CupertinoIcons.pencil,
            label: "Edit",
            borderRadius: BorderRadius.circular(8.0),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => context
                .read<HistoryBloc>()
                .add(DeleteHistory(discountModel: discount)),
            icon: CupertinoIcons.trash,
            label: "Delete",
            borderRadius: BorderRadius.circular(8.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  discount.date.toFormattedString(),
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                InfoWidget(
                  title: "Price Before Discount",
                  data: "\$ ${discount.priceBeforeDiscount.toStringAsFixed(2)}",
                ),
                InfoWidget(
                  title: "Discount Percentage",
                  data: "${discount.discountPercentage}%",
                ),
                InfoWidget(
                  title: "Discounted Price",
                  data: "\$${discount.discountedPrice.toStringAsFixed(2)}",
                ),
                if (discount.description.isNotEmpty) const Divider(),
                if (discount.description.isNotEmpty)
                  RichText(
                    text: TextSpan(
                      text: "Description: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: discount.description,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
