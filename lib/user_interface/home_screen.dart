import "package:discount_calculator/logical_interface/bloc/history_bloc.dart";
import "package:discount_calculator/user_interface/widgets/history_list.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  bool percentage = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryBloc, HistoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Discount Calculator"),
          ),
          body: Column(
            children: [
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: "Price",
                  prefix: Text("\$"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _discountController,
                decoration: InputDecoration(
                  labelText: "Discount",
                  suffixText: percentage ? "%" : null,
                  prefix: Text(percentage ? "" : "\$"),
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  const Text("Percentage"),
                  Switch(
                    value: percentage,
                    onChanged: (val) {
                      setState(() {
                        percentage = val;
                      });
                    },
                  ),
                  const Text("Amount"),
                ],
              ),
              Expanded(
                child: HistoryList(
                  state: state,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
