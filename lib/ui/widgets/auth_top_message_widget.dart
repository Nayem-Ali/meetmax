import 'package:flutter/material.dart';

import 'custom_txt_styles.dart';

class TopMessage extends StatelessWidget {
  const TopMessage({
    Key? key,
    required this.content,
    required this.fontSize,
    required this.edgeInsets,
  }) : super(key: key);

  final String content;
  final double fontSize;
  final EdgeInsets edgeInsets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: customizedText(
        content,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
