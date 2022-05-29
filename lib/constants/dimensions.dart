import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView = screenHeight / 2.64;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

// Dynamic height padding and margin
  static double height10 = screenHeight / 89.14;
  static double height15 = screenHeight / 59.42;
  static double height20 = screenHeight / 44.57;
  static double height30 = screenHeight / 29.71;
  static double height45 = screenHeight / 19.80;

// Dynamic width padding and margin
  static double width10 = screenHeight / 89.14;
  static double width15 = screenHeight / 59.42;
  static double width20 = screenHeight / 44.57;
  static double width30 = screenHeight / 29.71;

// font size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

// radius size
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // icons Size
  static double iconSize24 = screenHeight / 37.14;
  static double iconSize16 = screenHeight / 52.75;

  // list view Sizes
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  // popular food size
  static double imgSize = screenHeight / 2.41;

  // bottom Height
  static double bottomHeightBar = screenHeight / 7.03;
}
