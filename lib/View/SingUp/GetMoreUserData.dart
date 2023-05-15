import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padel_arena/HomePage/HomePage.dart';
import 'package:padel_arena/Model/UserData.dart';
import 'package:padel_arena/Services/LoadUser.dart';
import 'package:padel_arena/Services/UserService.dart';
import 'package:padel_arena/main.dart';

class GetExtraData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GetExtraData();
  }
}

class _GetExtraData extends State<GetExtraData> {
  final userController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Extra User Data"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                controller: userController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserName',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
                validator: (String? input){
                  if(input!.isEmpty){
                      return "Can not be empty";
                  }
                }
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
                validator: (String? input){
                  if(input!.isEmpty){
                      return "Can not be empty";
                  }
                }
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Checkbox(value: isChecked , onChanged:(value)=>{
                    setState(() => isChecked=value!,)
                  }),
                  const Text("Do you want to publish tournaments?")
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if(_formKey.currentState!.validate()){
                    pushDataAndGoToHomePage();
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
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: "HappyMonkey",
                        color: Colors.white,
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
  pushDataAndGoToHomePage(){
      UserData userData=UserData(userController.text.trim(), email!, firstNameController.text, lastNameController.text, "assets/splash.jpg", isChecked);
      UserService userService=UserService();
      userService.saveUser(userData);
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoadUser() ), ((route) => false));
  }
}