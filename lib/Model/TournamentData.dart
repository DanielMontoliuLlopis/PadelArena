import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class TournamentData{
  List<dynamic>? categories;
  Timestamp? finalDate;
  Timestamp? startDate;
  String? name;
  String? organizer;
  List<dynamic>? players; 
  String? urlImage;
  String? location;
  String? description;
  bool expanded=false;

  TournamentData(this.categories, this.finalDate, this.startDate, this.name, this.organizer, this.players, this.urlImage, this.location, this.description);

  TournamentData.constructorFromMap(Map<String, dynamic> params) {
    categories = params['categories']!;
    finalDate = params['final_date']!;
    startDate = params['start_date']!;
    name = params['name']!;
    urlImage = params['url_image']!;
    organizer = params['organizer']!;
    players=params['players']!;
    location=params['location']!;
    description=params['description']!;
  }

  Map<String, dynamic> toMap(){
    Map <String, dynamic> value={
      'categories': categories,
      'start_date':startDate,
      'final_date':finalDate,
      'name':name,
      'url_image':urlImage,
      'organizer':organizer,
      'players': players,
      'location':location,
      'description':description

    };
    return value;
  }

}