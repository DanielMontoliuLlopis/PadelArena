import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:padel_arena/Model/UserData.dart';

class TournamentData{
  Array<Int> categories;
  DateTime finalDate;
  DateTime startDate;
  String name;
  String organizer;
  Array players; 
  String urlImage;

  TournamentData(this.categories, this.finalDate, this.startDate, this.name, this.organizer, this.players, this.urlImage);

  Map<String, dynamic> toMap(){
    Map <String, dynamic> value={
      'categories': categories,
      'start_date':startDate,
      'final_date':finalDate,
      'name':name,
      'url_image':urlImage,
      'organizer':organizer,
      'players': players

    };
    return value;
  }

}