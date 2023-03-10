import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class NameWidget extends StatelessWidget {
  final double? textSize;
  final String name;
  final bool isOnline;
  const NameWidget({
    Key? key,
    this.textSize,
    required this.name,
    required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          RichText(
            text: TextSpan(
              text: name,
              style: TextStyle(
                fontSize: textSize ?? textStyleTheme.nameMediumStyle.fontSize,
              ),
            ),
          ),
          const SizedBox(width: 6),
          if (isOnline)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                width: constraints.maxWidth * 0.026,
                height: constraints.maxWidth * 0.026,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorsTheme.onlineColor,
                ),
              ),
            )
          else
            Container()
        ],
      );
    });
  }
}
