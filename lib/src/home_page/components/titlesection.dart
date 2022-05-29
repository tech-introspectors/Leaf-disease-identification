import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:plant_disease_detector/constants/dimensions.dart';
import 'package:plant_disease_detector/src/widgets/big_text.dart';

class TitleSection extends StatelessWidget {
  final String title;
  const TitleSection({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width20,
      ),
      child: BigText(
        text: title,
        color: AppColors.kMain,
        size: Dimensions.font26,
      ),
    );
  }
}
