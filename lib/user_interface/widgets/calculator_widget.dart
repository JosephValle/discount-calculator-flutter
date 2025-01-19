import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:uuid/uuid.dart';

import '../../logical_interface/bloc/history_bloc.dart';
import '../../models/discount_model.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();

  void _calculate() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final discountModel = DiscountModel(
      id: const Uuid().v4(),
      priceBeforeDiscount: double.parse(_priceController.text),
      date: DateTime.now(),
      description: '',
      discountedPrice: double.parse(_discountController.text),
    );
    context.read<HistoryBloc>().add(AddHistory(discountModel: discountModel));
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price Before Discount',
                  prefix: Text(r'$ '),
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (_) {
                  if (double.tryParse(_priceController.text) == null) {
                    return 'Invalid Price!';
                  }
                  return null;
                },
              ),
              const Gap(16),
              TextFormField(
                controller: _discountController,
                decoration: const InputDecoration(
                  labelText: 'Price After Discount',
                  prefix: Text(r'$ '),
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (_) => _calculate(),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (_) {
                  if (double.tryParse(_discountController.text) == null) {
                    return 'Invalid Price!';
                  }
                  return null;
                },
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: _calculate,
                child: const Text('Calculate'),
              ),
            ],
          ),
        ),
      );
}
