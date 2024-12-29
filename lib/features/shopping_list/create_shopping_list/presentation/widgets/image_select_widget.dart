import 'package:flutter/material.dart';

import 'package:shopping_organizer/core/color_extension.dart';

class ImageSelect extends StatelessWidget {
  const ImageSelect({
    required this.onTap,
    required this.iconData,
    this.isFirst = true,
    super.key,
  });

  final VoidCallback onTap;
  final IconData iconData;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: isFirst
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Theme.of(context)
                        .extension<ColorExtension>()!
                        .accentColor,
                  ),
                ),
              )
            : null,
        child: Center(
          child: Icon(
            iconData,
            color: Theme.of(context).extension<ColorExtension>()!.accentColor,
            size: 40,
          ),
        ),
      ),
    );
  }
}
