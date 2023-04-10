import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:padel_arena/HomePage/HomePage.dart';
import 'package:padel_arena/main.dart';

class LogIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _LogInState();
  }

}

class _LogInState extends State<LogIn>{
  final emailController=TextEditingController();
  final passController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Scaffold(
        appBar: AppBar(
          title: const Text("Saludos"),
      ),
        body: Container(
          child:
           Column(children:  [
            const SizedBox(
              height: 80,
            ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
              height: 40,
              ),
               TextField(
                controller: passController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',

                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),

              const SizedBox(
              height: 40,
              ),
              InkWell(
              onTap: () {
                logIn();
              },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  height: 70,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                ),
                child:const  Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: "HappyMonkey",
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                ),
              ),

              InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                height: Get.height * 0.035,
                width: Get.width,
                child: const Center(
                  child: Text(
                    "SingUp",
                    style: TextStyle(
                      fontFamily: "HappyMonkey",
                      color: Color.fromARGB(255, 100, 99, 99),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ), 
          ],)
        ),
    )
    );
  }

  Future logIn() async{
    print(passController.text.trim());
    showDialog(context: context, builder: (context)=>
      const Center(child: CircularProgressIndicator()), 
      barrierDismissible: false,
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passController.text.trim(),
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
    } on FirebaseAuthException catch  (e) {
       print('Failed with error code: ${e.code}');
        print(e.message);
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
    
  }

}