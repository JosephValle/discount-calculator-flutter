import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../logical_interface/bloc/history_bloc.dart';
import '../../models/discount_model.dart';

class DescriptionDialog extends StatelessWidget {
  DescriptionDialog({
    required this.discountModel,
    super.key,
  });
  final TextEditingController _descriptionController = TextEditingController();
  final DiscountModel discountModel;

  void _updateDescription(BuildContext context) {
    context.read<HistoryBloc>().add(
          UpdateHistory(
            discountModel: discountModel.copyWith(
              description: _descriptionController.text.trim(),
            ),
          ),
        );
    Navigator.of(context).pop();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    _descriptionController.text = discountModel.description;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
              minLines: 1,
              keyboardType: TextInputType.text,
              onFieldSubmitted: (_) => _updateDescription(context),
            ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () => _updateDescription(context),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<DiscountModel>('discountModel', discountModel));
  }
}
