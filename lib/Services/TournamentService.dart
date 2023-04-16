import 'package:firebase_database/firebase_database.dart';
import 'package:padel_arena/Model/TournamentData.dart';

class UserService{
  saveUser(TournamentData tournamentData){
    FirebaseDatabase.instance.ref().child('Tournaments').push().set(tournamentData.toMap());
  }
}