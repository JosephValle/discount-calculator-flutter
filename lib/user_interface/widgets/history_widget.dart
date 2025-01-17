import "package:discount_calculator/logical_interface/bloc/history_bloc.dart";
import "package:flutter/cupertino.dart";

import "history_tile.dart";

class HistoryWidget extends StatelessWidget {
  final HistoryState state;

  const HistoryWidget({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final items = state.discounts;
    return Column(
      children: [
        const Text(
          "History",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return HistoryTile(
                key: Key(item.id),
                discount: item,
              );
            },
          ),
        ),
      ],
    );
  }
}
