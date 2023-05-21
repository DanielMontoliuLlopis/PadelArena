import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padel_arena/Model/UserData.dart';
import 'package:padel_arena/Services/LoadUser.dart';
import 'package:padel_arena/Services/UserService.dart';
import 'package:padel_arena/generated/l10n.dart';
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
        title:  Text(S.current.extraUserDataTitle),
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
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: S.current.userName,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: firstNameController,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: S.current.firtsName, 
                ),
                validator: (String? input){
                  if(input!.isEmpty){
                      return S.current.emptyError;
                  }
                }
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: S.current.lastName,
                ),
                validator: (String? input){
                  if(input!.isEmpty){
                      return S.current.emptyError;
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
                   Text(S.current.publishTournaments)
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
                  child:  Center(
                    child: Text(
                      S.current.continuee,
                      style: const TextStyle(
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