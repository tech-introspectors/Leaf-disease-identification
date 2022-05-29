import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overFlow;
  final FontWeight? fontWeight;

  const BigText(
      {Key? key,
      this.color = const Color(0XFF332d2b),
      required this.text,
      this.fontWeight,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontFamily: 'SFBold',
        fontWeight: fontWeight,
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}
