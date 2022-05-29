import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';

import 'dotLayers.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationRotation;
  late Animation<double> animationRadiusIn;
  late Animation<double> animationRadiusOut;

  final double initialRadius = 40;
  double radius = 0;
  final double dotRadius = 8;
  final Color dotColor = Color.fromARGB(255, 0, 255, 8);
  final Color dotColor1 = Colors.white;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animationRotation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.5, 1.0, curve: Curves.linear),
    ));

    animationRadiusIn = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.75, 1.0, curve: Curves.linear)));

    animationRadiusOut = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.25, curve: Curves.linear)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animationRadiusIn.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animationRadiusOut.value * initialRadius;
        }
      });
    });

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kAccent,
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: RotationTransition(
            turns: animationRotation,
            child: Center(
              child: Stack(
                children: [
                  Dot(
                    radius: 30,
                    color: Colors.black12,
                  ),
                  DotLayers(
                    radius: radius,
                    spaceBetweenDot: 1,
                    dotRadius: dotRadius,
                    dotColor: dotColor,
                  ),
                  DotLayers(
                    radius: radius,
                    spaceBetweenDot: 2,
                    dotRadius: dotRadius,
                    dotColor: dotColor1,
                  ),
                  DotLayers(
                    radius: radius,
                    spaceBetweenDot: 3,
                    dotRadius: dotRadius,
                    dotColor: dotColor,
                  ),
                  DotLayers(
                    radius: radius,
                    spaceBetweenDot: 4,
                    dotRadius: dotRadius,
                    dotColor: dotColor1,
                  ),
                  DotLayers(
                    radius: radius,
                    spaceBetweenDot: 5,
                    dotRadius: dotRadius,
                    dotColor: dotColor,
                  ),
                  DotLayers(
                    radius: radius,
                    spaceBetweenDot: 6,
                    dotRadius: dotRadius,
                    dotColor: dotColor1,
                  ),
                  DotLayers(
                    radius: radius,
                    spaceBetweenDot: 7,
                    dotRadius: dotRadius,
                    dotColor: dotColor,
                  ),
                  DotLayers(
                    radius: radius,
                    spaceBetweenDot: 8,
                    dotRadius: dotRadius,
                    dotColor: dotColor1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
