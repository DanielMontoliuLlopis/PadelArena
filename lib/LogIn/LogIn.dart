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
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(
              height: 40,
              ),
              const TextField(
                decoration: InputDecoration(
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

}