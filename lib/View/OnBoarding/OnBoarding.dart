import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padel_arena/View/LogIn/LogIn.dart';
import 'package:padel_arena/generated/l10n.dart';


import 'OnBoardingModel.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home:Scaffold( 
    
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 11, 1, 150),
              Color.fromARGB(255, 0, 40, 150),
              Color.fromARGB(255, 0, 83, 190),
              Color.fromARGB(255, 0, 166, 231),
              Color.fromARGB(255, 0, 255, 34),
              Color.fromARGB(255, 6, 189, 0),
              Color.fromARGB(255, 1, 110, 7),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardContent(
                  title: demoData[index].title,
                  description: demoData[index].description,
                  image: demoData[index].image,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _pageIndex==3? InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LogIn()));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 48),
                height: Get.height * 0.075,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Center(
                  child: Text(
                    S.current.loginButton,
                    style: const TextStyle(
                      fontFamily: "HappyMonkey",
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ) : InkWell(
              onTap: () {
                _pageController.animateToPage(3, duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 48),
                height: Get.height * 0.075,
                width: Get.width,
                child:  Center(
                  child: Text(
                    S.current.skipButton, 
                    style: const TextStyle(
                      fontFamily: "HappyMonkey",
                      color: Color.fromARGB(255, 100, 99, 99),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ), 
          ],
        ),
      ),
    ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
         const SizedBox(
          height: 30,
        ),
        Image(image: AssetImage(image)),
        const SizedBox(
          height: 30,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}


class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      height: 8,
      width: 24 ,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.white,
        border: isActive ? null : Border.all(color: Colors.blue),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}