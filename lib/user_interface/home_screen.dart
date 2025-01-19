import "package:discount_calculator/logical_interface/bloc/history_bloc.dart";
import "package:discount_calculator/user_interface/widgets/calculator_widget.dart";
import "package:discount_calculator/user_interface/widgets/history_widget.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryBloc, HistoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              "Discount Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              // unfocus text field
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                const CalculatorWidget(),
                const Divider(),
                Expanded(
                  child: HistoryWidget(
                    state: state,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
