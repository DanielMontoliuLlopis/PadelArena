import 'package:flutter/material.dart';
import 'package:padel_arena/Model/TournamentData.dart';
import 'package:padel_arena/main.dart';

import 'TournamentPage.dart';

class MyTournaments extends StatefulWidget{
  const MyTournaments({super.key});

  @override
  _MyTournaments createState()=>_MyTournaments();
}

class _MyTournaments extends State<MyTournaments>{
  List<TournamentData> myTournamentsData=[];
  
  @override
  initState(){
    tournamentsData.forEach((element) {
      element.players!.forEach((element1) {
        if(element1["player1"] ==userData!.userName || element1["player2"] ==userData!.userName ){
          myTournamentsData.add(element);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: myTournamentsData.isNotEmpty ? ListView.builder(
          itemCount: myTournamentsData.length,
          itemBuilder: (context, position) {
            return Card(
                borderOnForeground: true,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  tileColor: Colors.amber,
                  title: Text(
                    myTournamentsData[position].name!.toUpperCase(),
                    style: const TextStyle(letterSpacing: 2, height: 0.5),
                  ),
                  trailing: IconButton(
                    icon: myTournamentsData[position].expanded
                        ? const Icon(Icons.keyboard_arrow_up_sharp)
                        : const Icon(Icons.keyboard_arrow_down_sharp),
                    onPressed: () => {
                      setState(() => {
                            tournamentsData[position].expanded =
                                !tournamentsData[position].expanded
                          })
                    },
                    padding:const EdgeInsets.all(6.0),
                  ),
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TournamentPage(tournamentsData[position])))
                  },
                  subtitle: tournamentsData[position].expanded
                      ? Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 15),
                          child: Center(
                              child: Column(
                            children: [
                              Text(
                                  "${tournamentsData[position].description}\n"),
                              Text(
                                  "From ${tournamentsData[position].startDate?.toDate().day}/${tournamentsData[position].startDate?.toDate().month}/"
                                  "${tournamentsData[position].startDate?.toDate().year} to ${tournamentsData[position].finalDate?.toDate().day}/"
                                  "${tournamentsData[position].finalDate?.toDate().month}/${tournamentsData[position].finalDate?.toDate().year}")
                            ],
                          )),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                ));
          }): const  Center(
            child: Text("You are not registered for any tournament"),
        ),
    );
    }
}
  
