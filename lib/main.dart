import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:padel_arena/Model/TournamentData.dart';
import 'package:padel_arena/Model/UserData.dart';
import 'package:padel_arena/Services/LoadUser.dart';
import 'package:padel_arena/Services/UserService.dart';
import 'package:padel_arena/firebase_options.dart';
import 'View/OnBoarding/OnBoarding.dart';
import 'View/HomePage/HomePage.dart';
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
UserData? userData;
List<TournamentData> tournamentsData=[];
final navigatorKey=GlobalKey<NavigatorState>();
UserService cosa=UserService();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: navigatorKey,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:  (context, snapshot)  { 
        if(snapshot.hasData){
          email=snapshot.data!.email;
          return LoadUser();
        }else{
          return const OnBoardingScreen();
        }
      })
    );
  }
}




