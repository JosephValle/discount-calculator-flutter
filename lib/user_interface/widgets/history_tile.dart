import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../logical_interface/bloc/history_bloc.dart';
import '../../models/discount_model.dart';
import '../../utilities/extensions/date_time_extensions.dart';
import 'description_dialog.dart';
import 'info_widget.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({required this.discount, super.key});

  final DiscountModel discount;

  @override
  Widget build(BuildContext context) => Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) async => showDialog(
                context: context,
                builder: (context) =>
                    DescriptionDialog(discountModel: discount),
              ),
              icon: CupertinoIcons.pencil,
              label: 'Edit',
              borderRadius: BorderRadius.circular(8),
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
              label: 'Delete',
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    discount.date.toFormattedString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  InfoWidget(
                    title: 'Price Before Discount',
                    data:
                        '\$ ${discount.priceBeforeDiscount.toStringAsFixed(2)}',
                  ),
                  InfoWidget(
                    title: 'Discount Percentage',
                    data: '${discount.discountPercentage.toStringAsFixed(2)}%',
                  ),
                  InfoWidget(
                    title: 'Total Savings',
                    data: '\$ ${discount.amountSaved.toStringAsFixed(2)}',
                  ),
                  InfoWidget(
                    title: 'Discounted Price',
                    data: '\$ ${discount.discountedPrice.toStringAsFixed(2)}',
                  ),
                  if (discount.description.isNotEmpty) const Divider(),
                  if (discount.description.isNotEmpty)
                    RichText(
                      text: TextSpan(
                        text: 'Description: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: discount.description,
                            style: const TextStyle(
                              fontSize: 16,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DiscountModel>('discount', discount));
  }
}
