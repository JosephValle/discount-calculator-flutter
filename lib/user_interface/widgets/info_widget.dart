import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({required this.title, required this.data, super.key});
  final String title;
  final dynamic data;

  @override
  State<InfoWidget> createState() => _InfoWidgetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(DiagnosticsProperty('data', data));
  }
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.title}: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              widget.data.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
}
