import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'OnBoarding/OnBoarding.dart';


void main() async{
  await Future.delayed(Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(new OnBoardingScreen());
}

