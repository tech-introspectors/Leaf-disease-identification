import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  const SmallText({
    Key? key,
    this.color = const Color(0XFFccc7c5),
    this.height = 1.2,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.fontStyle,
    this.size = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: color,
        fontFamily: 'SFRegular',
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: size,
        height: height,
      ),
    );
  }
}
