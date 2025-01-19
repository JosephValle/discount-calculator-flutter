import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../logical_interface/bloc/history_bloc.dart';
import 'history_tile.dart';

class HistoryWidget extends StatelessWidget {
  HistoryWidget({required this.state, super.key});

  final HistoryState state;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final items = state.discounts;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'History',
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<HistoryState>('state', state));
  }
}
