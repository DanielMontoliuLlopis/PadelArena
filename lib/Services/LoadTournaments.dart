import 'package:flutter/material.dart';
import 'package:padel_arena/Services/TournamentService.dart';
import 'package:padel_arena/View/Tournaments/TournamentsList.dart';
import '../main.dart';


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
      snapshot.data?.forEach((element) {
        tournamentsData.add(element);
      });
      return  TournamentsList();
    });
  }

}