import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:plant_disease_detector/constants/dimensions.dart';

class SuggestionCard extends StatefulWidget {
  final String title, value, assetImagePath;

  SuggestionCard({
    Key? key,
    required this.title,
    required this.value,
    required this.assetImagePath,
  }) : super(key: key);

  @override
  State<SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width15,
        vertical: Dimensions.height15,
      ),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
      ),
      child: Row(
        children: [
          Container(
            width: Dimensions.height45,
            height: Dimensions.height45,
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(widget.assetImagePath),
              ),
            ),
          ),
          Container(
            width: Dimensions.width30 * 9,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: AppColors.kMain,
                    fontSize: Dimensions.font16 * 1.2,
                    fontWeight: FontWeight.w500,
                    fontFamily: "SFBold",
                  ),
                ),
                Text(
                  widget.value,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 125, 126, 125),
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "SFRegular",
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
