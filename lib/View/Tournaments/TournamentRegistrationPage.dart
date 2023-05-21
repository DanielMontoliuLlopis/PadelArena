
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padel_arena/View/HomePage/HomePage.dart';
import 'package:padel_arena/Model/TournamentData.dart';
import 'package:padel_arena/Services/LoadTournaments.dart';
import 'package:padel_arena/Services/UserService.dart';
import 'package:padel_arena/generated/l10n.dart';
import 'package:padel_arena/main.dart';

import '../../Model/UserData.dart';
import '../../Services/TournamentService.dart';

class TournamentRegistrationPage extends StatefulWidget{

  final TournamentData tournamentData;

  const TournamentRegistrationPage(this.tournamentData);
  
  @override
  State<StatefulWidget> createState() => _TournamentRegistrationPage(tournamentData);

}

class _TournamentRegistrationPage extends State<TournamentRegistrationPage>{
  TournamentData tournamentData;
  _TournamentRegistrationPage(this.tournamentData);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int selectedCategory=0;
  final userController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title:  Text(S.current.titleTournamentRegistration),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
             DropdownButtonFormField<dynamic>(
              value: null,
              icon: const Icon(Icons.keyboard_arrow_down),    
              items: tournamentData.categories?.map((dynamic items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text("${S.current.category} $items"),
                );
              }).toList(),
              onChanged: (value) => selectedCategory=value,
              validator: (value) {
                if(value==null){
                  return "${S.current.emptyCategory} ";
                }
              }
            
            ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                enabled: false,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  
                  hintText: email!.toString(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: userController,
                decoration:  InputDecoration(
                  border:const OutlineInputBorder(),
                  labelText: S.current.player2,
                  hintText: S.current.emailPlayer2,
                ),
                validator: (String? input){
                 
                   if(input==null) return S.current.emptyError;
                  return null;
                }
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
                      style:const TextStyle(
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
      tournamentData.players?.add({
        "category": selectedCategory,
        "player1": email,
        "player2": userController.text.trim()
      });
      TournamentService().updateTournament(tournamentData);
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage() ), ((route) => false));
  }
}