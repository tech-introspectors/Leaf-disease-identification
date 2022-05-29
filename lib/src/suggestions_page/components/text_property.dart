import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';

// ignore: must_be_immutable
class TextProperty extends StatelessWidget {
  TextProperty({
    Key? key,
    required this.title,
    required this.value,
    this.valueTextSize = 0,
    this.titleSize = 0,
    this.titleColor = const Color(0xff626463),
    this.titleTextAlign,
    required this.height,
  }) : super(key: key);

  final String title;
  double? titleSize, valueTextSize;
  final double height;
  final String value;
  final Color? titleColor;
  final TextAlign? titleTextAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          title: Text(
            title,
            textAlign: titleTextAlign,
            style: TextStyle(
              color: titleColor,
              fontFamily: 'SFBold',
              fontSize: titleSize != 0 ? titleSize : (0.039 * height),
            ),
          ),
          subtitle: Text(
            value,
            style: TextStyle(
              color: AppColors.kSecondary,
              fontFamily: 'SFRegular',
              fontSize: valueTextSize != 0 ? valueTextSize : (0.026 * height),
            ),
          ),
        )
      ],
    );
  }
}
