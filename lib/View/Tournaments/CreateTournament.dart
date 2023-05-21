import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padel_arena/View/HomePage/HomePage.dart';
import 'package:padel_arena/Model/TournamentData.dart';
import 'package:padel_arena/Services/LoadTournaments.dart';
import 'package:padel_arena/Services/TournamentService.dart';
import 'package:padel_arena/generated/l10n.dart';
import 'package:padel_arena/main.dart';

class CreateTournament extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_CreateTournament();

}

class _CreateTournament extends State<CreateTournament>{
  final nameController=TextEditingController();
  final startDateController=TextEditingController();
  final finalDateController=TextEditingController();
  final locationController=TextEditingController();
  final descriptionController=TextEditingController();
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
          title:  Text(S.current.newTournament),
      ),
        body: SingleChildScrollView(child: Form(
          key: _formKey,
          child:
           Column(children:  [
            const SizedBox(
              height: 40,
            ),
              TextFormField(
                controller: nameController,
                
                decoration:  InputDecoration(
                  border:const OutlineInputBorder(),
                  labelText: S.current.tournamentName,
                ),
                validator: (String? input){
                  if(input!.isEmpty){
                      return S.current.emptyError;
                  }
                }
              ),
              const SizedBox(
              height: 20,
              ),
               TextFormField(
                controller: startDateController,
                readOnly: true,
                keyboardType: TextInputType.datetime,
                decoration:  InputDecoration(
                  border:const OutlineInputBorder(),
                  labelText: S.current.startDate,

                ),
                onTap: () async {
                  DateTime? pickedDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2101));
                  if(pickedDate != null ){
                      
                      String formattedDate = pickedDate.toString();
                      setState(() {
                         startDateController.text = formattedDate; 
                      });
                  }
                },
                validator: (String? input){
                   if(input==null){
                      return S.current.emptyError;
                  }
                  
                }
              ),
               const SizedBox(
                  height: 20,
              ),
               TextFormField(
                controller: finalDateController,
                readOnly: true,
                keyboardType: TextInputType.datetime,
                decoration:  InputDecoration(
                  border:const OutlineInputBorder(),
                  labelText: S.current.finalDate,

                ),
                onTap: () async {
                  DateTime? pickedDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2101));
                  if(pickedDate != null ){
                      
                      String formattedDate = pickedDate.toString();
                      setState(() {
                         finalDateController.text = formattedDate; 
                      });
                  }
                },
                validator: (String? input){
                  if(input==null){
                      return S.current.emptyError;
                  }
                  DateTime date= DateTime.parse(startDateController.text);
                  DateTime finalDate= DateTime.parse(input);
                  if(date.isAfter(finalDate)){
                      return S.current.dateError;
                  }
                }
              ),
               const SizedBox(
                  height: 20,
              ),
              TextFormField(
                controller: locationController,
                
                decoration:  InputDecoration(
                  border:const OutlineInputBorder(),
                  labelText: S.current.location,
                ),
                validator: (String? input){
                  if(input==""){
                      return S.current.emptyError;
                  }
                }
              ),
              CheckboxListTile(
                title:  Text(S.current.firtsCategory),
                value: firstCategory,
                onChanged: (newValue) {
                  setState(() {
                  firstCategory = newValue!;
                });
              },
                controlAffinity: ListTileControlAffinity.leading,  
              ),
              CheckboxListTile(
                title:  Text(S.current.secondCategory),
                value: secondCategory,
                onChanged: (newValue) {
                  setState(() {
                  secondCategory = newValue!;
                });
              },
                controlAffinity: ListTileControlAffinity.leading,  
              ),
               CheckboxListTile(
                title:  Text(S.current.thirdCategory),
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
              TextFormField(
                controller: descriptionController,
                minLines: 3,
                maxLines: 5 ,
                
                decoration:  InputDecoration(
                  border:const OutlineInputBorder(),
                  labelText: S.current.description,
                ),
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
                    S.current.createTournament,
                    style:const TextStyle(
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
    TournamentData tournamentData=TournamentData(categories, Timestamp.now() , Timestamp.now(), nameController.text, userData?.userName, [], "", locationController.text, descriptionController.text);
    TournamentService().saveTournament(tournamentData);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage() ), ((route) => false));

  }
}

