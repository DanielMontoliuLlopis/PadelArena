import 'package:flutter/material.dart';
import 'package:padel_arena/Tournaments/TournamentPage.dart';
import 'package:padel_arena/main.dart';

class TournamentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: tournamentsData.length,
          itemBuilder: (context, position) {
            return Card(
              borderOnForeground: true,
                child: ListTile(
              tileColor: Colors.amber,
              title: Text("${tournamentsData[position].name}"),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        TournamentPage(tournamentsData[position])))
              },
            ));
          }),
          
    );
  }
}
