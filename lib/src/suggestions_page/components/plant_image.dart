import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';

class PlantImage extends StatelessWidget {
  const PlantImage(
      {Key? key,
      required this.size,
      required this.imageFile,
      required this.borderColor})
      : super(key: key);

  final Size size;
  final File imageFile;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        border: Border.all(
          width: 5,
          color: AppColors.kMain,
        ),
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 2),
            blurRadius: 15,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: size.width * 0.3,
        backgroundImage: Image.file(
          imageFile,
          fit: BoxFit.cover,
        ).image,
      ),
    );
  }
}
