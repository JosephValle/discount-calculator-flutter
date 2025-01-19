import "package:discount_calculator/logical_interface/bloc/history_bloc.dart";
import "package:flutter/material.dart";

import "history_tile.dart";

class HistoryWidget extends StatelessWidget {
  final HistoryState state;
  final ScrollController _scrollController = ScrollController();

  HistoryWidget({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final items = state.discounts;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "History",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(),
        Expanded(
          child: Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
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
        ),
      ],
    );
  }
}
