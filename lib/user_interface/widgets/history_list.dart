import "package:discount_calculator/logical_interface/bloc/history_bloc.dart";
import "package:flutter/cupertino.dart";

import "history_tile.dart";

class HistoryList extends StatelessWidget {
  final HistoryState state;

  const HistoryList({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final items = state.discounts;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return HistoryTile(
          key: Key(item.id),
          discount: item,
        );
      },
    );
  }
}
