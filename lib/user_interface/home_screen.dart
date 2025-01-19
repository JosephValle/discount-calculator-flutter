import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logical_interface/bloc/history_bloc.dart';
import 'widgets/calculator_widget.dart';
import 'widgets/history_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'Discount Calculator',
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
        ),
      );
}
