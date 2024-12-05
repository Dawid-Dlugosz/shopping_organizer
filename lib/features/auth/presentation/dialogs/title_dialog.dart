import 'package:flutter/material.dart';
import 'package:shopping_organizer/core/color_extension.dart';

class TitleDialog extends StatelessWidget {
  const TitleDialog({
    required this.title,
    required this.message,
    super.key,
  });

  final String message;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorExtension = Theme.of(context).extension<ColorExtension>()!;
    return Dialog(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: colorExtension.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: colorExtension.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
