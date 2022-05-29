import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:plant_disease_detector/constants/dimensions.dart';
import 'package:plant_disease_detector/services/disease_provider.dart';
import 'package:plant_disease_detector/services/hive_database.dart';
import 'package:plant_disease_detector/src/home_page/models/disease_model.dart';
import 'package:plant_disease_detector/src/suggestions_page/suggestions.dart';
import "package:get/get.dart";
import 'package:plant_disease_detector/src/widgets/spacing.dart';

class HistorySection extends StatefulWidget {
  final Size size;
  final DiseaseService diseaseService;

  const HistorySection(
      {Key? key, required this.size, required this.diseaseService})
      : super(key: key);

  @override
  State<HistorySection> createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  // removing from the memory when not using
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Disease>>(
      valueListenable: Boxes.getDiseases().listenable(),
      builder: (context, box, _) {
        final diseases = box.values.toList().cast<Disease>();

        if (diseases.isNotEmpty) {
          return SizedBox(
              height: Dimensions.height45 * 5.2,
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: diseases.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return _returnHistoryContainer(index, diseases[index],
                      context, widget.diseaseService, widget.size);
                },
              ));
        } else {
          return _returnNothingToShow(widget.size);
        }
      },
    );
  }

  Widget _returnHistoryContainer(int index, Disease disease,
      BuildContext context, DiseaseService diseaseService, Size size) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return GestureDetector(
      onTap: () {
        // Set disease for Disease Service
        diseaseService.setDiseaseValue(disease);

        Navigator.restorablePushNamed(
          context,
          Suggestions.routeName,
        );
      },
      child: Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: _height,
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.file(
                      File(disease.imagePath),
                    ).image,
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kAccent,
                      offset: Offset(2, 2),
                      spreadRadius: 0.5,
                      blurRadius: (0.022 * size.height * 0.3),
                    ),
                  ],
                  color: AppColors.kSecondary,
                  borderRadius:
                      BorderRadius.circular((0.053 * size.height * 0.3))),
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: Dimensions.height45 * 4,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular((0.053 * size.height * 0.3)),
                            bottomRight:
                                Radius.circular((0.053 * size.height * 0.3))),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          tileMode: TileMode.mirror,
                          colors: <Color>[
                            AppColors.kMain,
                            Color.fromARGB(139, 0, 173, 89),
                            Color.fromARGB(86, 0, 173, 89),
                            Colors.transparent
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Disease: ' + disease.name,
                              style: TextStyle(
                                color: AppColors.kWhite,
                                fontSize: (0.066 * size.height * 0.3),
                                fontFamily: 'SFBold',
                              )),
                          verticalSpacing(Dimensions.height10),
                          Text(
                              'Date: ${disease.dateTime.day}/${disease.dateTime.month}/${disease.dateTime.year}',
                              style: TextStyle(
                                color: AppColors.kWhite,
                                fontSize: (0.066 * size.height * 0.3),
                                fontFamily: 'SFBold',
                              )),
                          verticalSpacing(Dimensions.height20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _returnNothingToShow(Size size) {
  return Padding(
    padding: EdgeInsets.fromLTRB((0.053 * size.height * 0.3),
        (0.053 * size.height * 0.3), (0.053 * size.height * 0.3), 0),
    child: Container(
        height: Dimensions.height45 * 4.5,
        decoration: BoxDecoration(
            color: AppColors.kMain,
            borderRadius: BorderRadius.circular((0.053 * size.height * 0.3))),
        child: Center(
            child: Text(
          "nothingToShow".tr,
          style: TextStyle(
            color: AppColors.kWhite,
            fontSize: Dimensions.font20,
          ),
        ))),
  );
}
