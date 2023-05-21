

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padel_arena/Model/TournamentData.dart';

class TournamentService{

  final db=FirebaseFirestore.instance;

  saveTournament(TournamentData tournamentData){
    db.collection("Tournaments").add(tournamentData.toMap());
  }

  Future<List> getAllTournaments() async{
    List<TournamentData> list=[];
   await db.collection("Tournaments").get().then((event) => {
      for(var co in event.docs){
        list.add(TournamentData.constructorFromMap(co.data(), co.id))
      }
   });
   return list;
  }

  void updateTournament(TournamentData tournamentData) {
    db.collection("Tournaments").doc(tournamentData.id).update(tournamentData.toMap());
  }

  void deleteTournament(TournamentData tournamentData){
    db.collection("Tournaments").doc(tournamentData.id).delete();
  }
}