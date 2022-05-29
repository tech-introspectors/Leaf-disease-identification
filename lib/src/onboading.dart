import 'package:plant_disease_detector/data/data.dart';
import 'package:flutter/material.dart';
import 'package:plant_disease_detector/src/home_page/home.dart';

class OnBoadingScreen extends StatefulWidget {
  const OnBoadingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoadingScreen> createState() => _OnBoadingScreenState();
}

class _OnBoadingScreenState extends State<OnBoadingScreen> {
  List<SliderModel> mySlides = [];
  int slideIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.green : Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySlides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (val) {
            setState(() {
              slideIndex = val;
            });
          },
          itemCount: mySlides.length,
          itemBuilder: (context, index) {
            return SliderTile(
              imagePath: mySlides[index].getImageAssetPath(),
              title: mySlides[index].getTitle(),
              desc: mySlides[index].getDesc(),
            );
          },
        ),
      ),
      bottomSheet: slideIndex != mySlides.length - 1
          ? Container(
              height: 180,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < mySlides.length; i++)
                        slideIndex == i
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  slideIndex == 0
                      ? Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green.withOpacity(0.7),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.8),
                                  offset: Offset(5, 5),
                                  blurRadius: 15,
                                ),
                              ]),
                          child: RawMaterialButton(
                            onPressed: () {
                              pageController.animateToPage(slideIndex + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            },
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                            fillColor: Colors.green[600],
                            splashColor: Colors.green[600],
                            child: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                pageController.animateToPage(slideIndex - 1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.linear);
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8),
                              fillColor: Colors.green.withOpacity(0.5),
                              splashColor: Colors.green,
                              child: const Icon(
                                Icons.keyboard_arrow_left,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  pageController.animateToPage(slideIndex + 1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 7,
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.8),
                                        offset: const Offset(2, 2),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: const [
                                      Text(
                                        "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_right,
                                          color: Colors.white, size: 30),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );

                setState(() {});
              },
              child: Container(
                height: 60,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(
                  "GET STARTED NOW",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String imagePath, title, desc;

  const SliderTile(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
