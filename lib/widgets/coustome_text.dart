import 'package:flutter/material.dart';

class coustomeText extends StatelessWidget {

  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const coustomeText({Key? key,
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
    this.fontStyle,
    this.textOverflow,
    this.maxLine,
    this.textAlign,
    this.textDecoration,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text ?? '',
      maxLines: maxLine,
      textAlign: textAlign,
      style: TextStyle(
          decoration: textDecoration ?? TextDecoration.none,
          overflow: textOverflow ?? TextOverflow.ellipsis,
          color: color ?? Colors.black,
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontStyle: fontStyle ?? FontStyle.normal),
    );
  }
}
