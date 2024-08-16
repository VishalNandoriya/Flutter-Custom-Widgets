import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String txt;
  final TextStyle? styles;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const TextWidget(
      {super.key,
        required this.txt,
        this.styles,
        this.textAlign = TextAlign.center,
        this.overflow,
        this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: textAlign,
      style: styles,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
