import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:plant_disease_detector/constants/dimensions.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45 * 4,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width20,
      ),
      decoration: BoxDecoration(
        color: AppColors.kMain,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimensions.radius30),
            bottomRight: Radius.circular(Dimensions.radius30)),
      ),
      child: Center(
          child: Text(
        "Leaf Disease Identification by Team Intropectors",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: Dimensions.font26,
          color: AppColors.kWhite,
        ),
      )),
    );
  }
}
