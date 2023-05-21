import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:padel_arena/View/LogIn/LogIn.dart';
import 'package:padel_arena/View/SingUp/GetMoreUserData.dart';
import 'package:padel_arena/generated/l10n.dart';
import 'package:padel_arena/main.dart';

class SingUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SingUpState();
  }
}

class _SingUpState extends State<SingUp> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passRepeatedController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title:  Text(S.current.loginButton),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                controller: emailController,
                decoration:  InputDecoration(
                  border:const OutlineInputBorder(),
                  labelText: S.current.email,
                ),
                validator: (String? input) {
                  if (!input!.contains('@')) {
                    return S.current.emailError;
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: passController,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: S.current.password,
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (String? input){
                  if(input!.length<6){
                      return S.current.passwordError;
                  }
                }
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: passRepeatedController,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: S.current.repeatPassword,
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (String? input){
                  if(input!=passController.text.trim()){
                      return S.current.diferentPassword;
                  }
                }
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if(_formKey.currentState!.validate()){
                    singUp();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  height: 70,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Center(
                    child: Text(
                      S.current.singUp,
                      style:const TextStyle(
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
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LogIn()),
                      ((route) => false));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  height: Get.height * 0.035,
                  width: Get.width,
                  child:  Center(
                    child: Text(
                      S.current.haveAccount, 
                      style:const TextStyle(
                        fontFamily: "HappyMonkey",
                        color: Color.fromARGB(255, 100, 99, 99),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    ));
  }

  Future singUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );
        email=emailController.text.trim();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => GetExtraData()),
            ((route) => false));
      } on FirebaseAuthException catch (e) {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
      }
  }
}
