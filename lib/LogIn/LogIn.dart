import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _LogInState();
  }

}

class _LogInState extends State<LogIn>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child:
           Column(children:  [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',

                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              InkWell(
              onTap: () {
                
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 48),
                height: Get.height * 0.075,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Login / Registration",
                    style: TextStyle(
                      fontFamily: "HappyMonkey",
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              ),
              InkWell(  onTap: () {
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 48),
                height: Get.height * 0.075,
                width: Get.width,
                child: const Center(
                  child: Text(
                    "LogIn",
                    style: TextStyle(
                      fontFamily: "HappyMonkey",
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),)
          ],)
        ),
    );
  }

}