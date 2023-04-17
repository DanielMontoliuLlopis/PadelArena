import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:padel_arena/firebase_options.dart';
import 'OnBoarding/OnBoarding.dart';
import "HomePage/HomePage.dart";
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await Future.delayed( const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(MyApp() );
}
String? email="";
final navigatorKey=GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: navigatorKey,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:  (context, snapshot){ 
        if(snapshot.hasData){
          email=snapshot.data!.email;
          return HomePage();
        }else{
          return const OnBoardingScreen();
        }
      })
    );
  }
}