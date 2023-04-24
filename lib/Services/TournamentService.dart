// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:padel_arena/Model/TournamentData.dart';

class TournamentService{

  final db=FirebaseFirestore.instance;
  final ref=FirebaseDatabase.instanceFor(app:Firebase.app(), databaseURL: "https://padel-arena-5b4cb-default-rtdb.europe-west1.firebasedatabase.app" ).ref();

  saveTournament(TournamentData tournamentData){
    FirebaseDatabase.instanceFor(app:Firebase.app(), databaseURL: "https://padel-arena-5b4cb-default-rtdb.europe-west1.firebasedatabase.app" ).ref().child('Tournaments').push().set(tournamentData.toMap());
  }

  Future<List> getAllTournaments() async{
    List<TournamentData> list=[];
   await db.collection("Tournaments").get().then((event) => {
      for(var co in event.docs){
        list.add(TournamentData.constructorFromMap(co.data()))
      }
   });
   return list;
  }
}