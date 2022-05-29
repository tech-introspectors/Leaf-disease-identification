import 'package:flutter/material.dart';

import 'package:plant_disease_detector/constants/constants.dart';

import 'package:plant_disease_detector/src/home_page/components/hidden_drawer.dart';
import 'package:plant_disease_detector/src/home_page/components/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  double xOffset = 0.0, yOffset = 0.0, rotateAngle = 0.0, scaleFactor = 1.0;
  bool isDrawerOpen = false, isLoading = true;
  bool isAnimating = false;

  Future<void> loading() async {
    await Future.delayed(const Duration(milliseconds: 3000));

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    loading();

    return Scaffold(
      backgroundColor: AppColors.kWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
        ),
        onPressed: () {
          isAnimating = !isAnimating;

          isAnimating
              ? _animationController.forward()
              : _animationController.reverse();

          if (isDrawerOpen) {
            setState(() {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              rotateAngle = 0;
              isDrawerOpen = false;
            });
          } else {
            setState(() {
              xOffset = 280;
              yOffset = 170;
              scaleFactor = 0.7;
              rotateAngle = -0.1;
              isDrawerOpen = true;
            });
          }
        },
      ),
      body: Stack(
        children: [
          HiddenDrawer(),
          AnimatedContainer(
            transform: Matrix4.translationValues(
                xOffset - (isDrawerOpen ? 10 : 0),
                yOffset + (isDrawerOpen ? 30 : 0),
                0)
              ..rotateZ(rotateAngle)
              ..scale(scaleFactor - (isDrawerOpen ? 0.07 : 0)),
            duration: const Duration(milliseconds: 250),
            child: Container(
              color: Color.fromARGB(109, 236, 253, 232),
            ),
          ),
          AnimatedContainer(
            transform: Matrix4.translationValues(
                xOffset - (isDrawerOpen ? 20 : 0),
                yOffset + (isDrawerOpen ? 55 : 0),
                0)
              ..rotateZ(rotateAngle)
              ..scale(scaleFactor - (isDrawerOpen ? 0.12 : 0)),
            duration: const Duration(milliseconds: 250),
            child: Container(
              color: Color.fromARGB(66, 236, 253, 232),
            ),
          ),
          AnimatedContainer(
            alignment: Alignment.topCenter,
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..rotateZ(rotateAngle)
              ..scale(scaleFactor),
            duration: const Duration(milliseconds: 250),
            child: Homescreen(),
          )
        ],
      ),
    );
  }
}
