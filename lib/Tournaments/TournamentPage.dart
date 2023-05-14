import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:padel_arena/Model/TournamentData.dart';
import 'package:padel_arena/main.dart';

import 'TournamentRegistrationPage.dart';

class TournamentPage extends StatelessWidget {
  TournamentData tournament;
  bool isInscribed=false;
  TournamentPage(this.tournament, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tournament.name!.toUpperCase()),
      ),
      body: Column(children: [
        Center(
          child: Text(
            tournament.name!.toUpperCase(),
            style: const TextStyle(
              fontSize: 30,
              letterSpacing: 3,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          child: Container(
                    margin: const EdgeInsets.all(7.5),
          padding: const EdgeInsets.all(7.5) ,
          width: Get.width,
          height: Get.height*0.2,
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              )),
          child: Text("Description : \n ${tournament.description}"),
        ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: Get.width,
          margin: const EdgeInsets.all(7.5),
          padding: const EdgeInsets.all(7.5) ,
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              )),
          child: Text("Location : ${tournament.location}" , textAlign: TextAlign.center,),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: Get.width,
                    margin: const EdgeInsets.all(7.5),
          padding: const EdgeInsets.all(7.5) ,
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              )),
          child:  Text(
            "From ${tournament.startDate?.toDate().day}/${tournament.startDate?.toDate().month}/"
            "${tournament.startDate?.toDate().year} to ${tournament.finalDate?.toDate().day}/"
            "${tournament.finalDate?.toDate().month}/${tournament.finalDate?.toDate().year}", textAlign: TextAlign.center,),
        ),
       
      ]),
      floatingActionButton:  FloatingActionButton(
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                          TournamentRegistrationPage(tournament)));
              },
              child: const Icon(Icons.add),
            )
          ,
    );
  }
}
