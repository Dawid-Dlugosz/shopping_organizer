import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_organizer/core/color_extension.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({required this.timestamp, super.key});

  final int timestamp;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final formatDate = DateFormat('dd-MM-yy').format(date);

    return Row(
      spacing: 5,
      children: [
        Icon(
          Icons.create,
          size: 20,
          color: Theme.of(context).extension<ColorExtension>()!.accentColor,
        ),
        Text(formatDate),
      ],
    );
  }
}
