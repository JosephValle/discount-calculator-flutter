import "package:discount_calculator/logical_interface/bloc/history_bloc.dart";
import "package:discount_calculator/models/discount_model.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:gap/gap.dart";

class DescriptionDialog extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController(
  );
  final DiscountModel discountModel;

  DescriptionDialog({
    required this.discountModel,
    super.key,
  });

  void _updateDescription(BuildContext context) {
    context.read<HistoryBloc>().add(UpdateHistory(
          discountModel: discountModel.copyWith(
            description: _descriptionController.text.trim(),
          ),
        ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _descriptionController.text = discountModel.description;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
              minLines: 1,
              keyboardType: TextInputType.text,
              onFieldSubmitted: (_) => _updateDescription(context),
            ),
            const Gap(16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () => _updateDescription(context),
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
