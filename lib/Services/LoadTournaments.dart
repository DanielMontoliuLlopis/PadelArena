import 'package:flutter/material.dart';
import 'package:padel_arena/Model/TournamentData.dart';
import 'package:padel_arena/Services/TournamentService.dart';
import 'package:padel_arena/Tournaments/TournamentsList.dart';
import '../HomePage/HomePage.dart';
import '../Model/UserData.dart';
import '../main.dart';
import 'UserService.dart';

class LoadTournaments extends StatelessWidget{
  Future<List> tournaments=TournamentService().getAllTournaments();
  
  LoadTournaments({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: tournaments,
    builder: ( context,  snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(),);
      }
      tournamentsData=[];
      snapshot.data!.forEach((element) {
        tournamentsData.add(element);
      });
      return  TournamentsList();
    });
  }

}