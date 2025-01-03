import 'package:flutter/material.dart';
import 'package:shopping_organizer/core/color_extension.dart';

class OwnerNameWidget extends StatelessWidget {
  const OwnerNameWidget({
    required this.ownerName,
    super.key,
  });

  final String ownerName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.person,
          size: 20,
          color: Theme.of(context).extension<ColorExtension>()!.accentColor,
        ),
        Text(ownerName),
      ],
    );
  }
}
