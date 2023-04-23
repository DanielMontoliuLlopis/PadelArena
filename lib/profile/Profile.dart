import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padel_arena/LogIn/LogIn.dart';
import 'package:padel_arena/main.dart';
import 'package:get/get.dart';

import '../HomePage/HomePage.dart';

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _ProfileState();
  }

}
class _ProfileState extends State<Profile>{

  @override
  Widget build(BuildContext context) {
      return(
        Column(children:[
           Text("${userData?.userName}"),
           Text("${userData?.email}"),
           Text("${userData?.firstName}"),
           Text("${userData?.lastName}"),
          InkWell(
                onTap: () {
                  logOut();
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  height: 70,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        fontFamily: "HappyMonkey",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
        ],)
      );
  }

  Future logOut() async{
    showDialog(context: context, builder: (context)=>
      const Center(child: CircularProgressIndicator()), 
      barrierDismissible: false,
    );
    try {
      await FirebaseAuth.instance.signOut();
      userData=null;
      email=null;
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  LogIn() ), ((route) => false));
    } on FirebaseAuthException catch  (e) {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
    
  }

}