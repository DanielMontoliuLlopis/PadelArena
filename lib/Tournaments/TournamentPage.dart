

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_arena/Model/TournamentData.dart';

class TournamentPage extends StatelessWidget{
  TournamentData tournament;
  TournamentPage(this.tournament, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tournament.name!),
      ),
    );
  }

}