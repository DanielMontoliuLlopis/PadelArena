import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padel_arena/HomePage/HomePage.dart';
import 'package:padel_arena/Model/TournamentData.dart';
import 'package:padel_arena/Services/LoadTournaments.dart';
import 'package:padel_arena/Services/TournamentService.dart';
import 'package:padel_arena/main.dart';

class CreateTournament extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_CreateTournament();

}

class _CreateTournament extends State<CreateTournament>{
  final nameController=TextEditingController();
  final startDateController=TextEditingController();
  final finalDateController=TextEditingController();
  bool firstCategory=false;
  bool secondCategory=false;
  bool thirdCategory=false;
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("New Tournament"),
      ),
        body: Form(
          key: _formKey,
          child:
           Column(children:  [
            const SizedBox(
              height: 80,
            ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tournament Name',
                ),
                validator: (String? input){
                  if(input!.isEmpty){
                      return "The name can not be empty";
                  }
                }
              ),
              const SizedBox(
              height: 40,
              ),
               TextFormField(
                controller: startDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Start date',

                ),
                validator: (String? input){
                  DateTime date= DateTime.parse(input!);
                  if(date.isBefore(DateTime.now())){
                      return "The start date can´t be before now";
                  }
                }
              ),
               TextFormField(
                controller: finalDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Final date',

                ),
                validator: (String? input){
                  DateTime date= DateTime.parse(input!);
                  if(date.isBefore(DateTime.now())){
                      return "The final date can´t be before now";
                  }
                }
              ),
              CheckboxListTile(
                title: const Text("First Category"),
                value: firstCategory,
                onChanged: (newValue) {
                  setState(() {
                  firstCategory = newValue!;
                });
              },
                controlAffinity: ListTileControlAffinity.leading,  
              ),
              CheckboxListTile(
                title: const Text("Second Category"),
                value: secondCategory,
                onChanged: (newValue) {
                  setState(() {
                  secondCategory = newValue!;
                });
              },
                controlAffinity: ListTileControlAffinity.leading,  
              ),
                            CheckboxListTile(
                title: const Text("Third Category"),
                value: thirdCategory,
                onChanged: (newValue) {
                  setState(() {
                  thirdCategory = newValue!;
                });
              },
                controlAffinity: ListTileControlAffinity.leading,  
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
                child:const  Center(
                  child: Text(
                    "Create Tournament",
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
        ),
    )
    );
  }
  pushDataAndGoToHomePage(){
    List categories=[];
    if(firstCategory) categories.add(1);
    if(secondCategory) categories.add(2);
    if(thirdCategory) categories.add(3);
    DateTime startDate= DateTime.parse(startDateController.text);
    DateTime finalDate= DateTime.parse(finalDateController.text);
    TournamentData tournamentData=TournamentData(categories, Timestamp.now() , Timestamp.now(), nameController.text, userData?.userName, [], "");
    TournamentService().saveTournament(tournamentData);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage() ), ((route) => false));

  }
}

