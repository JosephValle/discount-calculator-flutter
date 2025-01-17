import "package:discount_calculator/logical_interface/bloc/history_bloc.dart";
import "package:discount_calculator/models/discount_model.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:gap/gap.dart";
import "package:uuid/uuid.dart";

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  bool percentage = true;

  void _calculate() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final DiscountModel discountModel = DiscountModel(
      id: const Uuid().v4(),
      priceBeforeDiscount: double.parse(_priceController.text),
      discount: double.parse(_discountController.text),
      fixedDiscount: !percentage,
      date: DateTime.now(),
      description: "",
    );
    context.read<HistoryBloc>().add(AddHistory(discountModel: discountModel));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: "Price",
                prefix: Text("\$"),
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              validator: (_) {
                if (double.tryParse(_priceController.text) == null) {
                  return "Invalid price";
                }
                return null;
              },
            ),
            const Gap(8),
            TextFormField(
              controller: _discountController,
              decoration: InputDecoration(
                labelText: "Discount ${percentage ? "Percentage" : "Amount"}",
                suffixText: percentage ? "%" : null,
                prefix: Text(percentage ? "" : "\$"),
                border: const OutlineInputBorder(),
              ),
              onFieldSubmitted: (_) => _calculate(),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              validator: (_) {
                if (double.tryParse(_discountController.text) == null) {
                  return "Invalid discount";
                }
                return null;
              },
            ),
            const Gap(8),
            Row(
              children: [
                const Text("Amount"),
                const Gap(8),
                Switch(
                  value: percentage,
                  onChanged: (val) {
                    setState(() {
                      percentage = val;
                    });
                  },
                ),
                const Gap(8),
                const Text("Percentage"),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => _calculate(),
                  child: const Text("Calculate"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
