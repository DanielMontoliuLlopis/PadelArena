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
        if(element1["player1"] ==userData!.email || element1["player2"] ==userData!.email ){
          if(!myTournamentsData.contains(element))myTournamentsData.add(element);
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
                            myTournamentsData[position].expanded =
                                !myTournamentsData[position].expanded
                          })
                    },
                    padding:const EdgeInsets.all(6.0),
                  ),
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TournamentPage(myTournamentsData[position])))
                  },
                  subtitle: myTournamentsData[position].expanded
                      ? Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 15),
                          child: Center(
                              child: Column(
                            children: [
                              Text(
                                  "${myTournamentsData[position].description}\n"),
                              Text(
                                  "From ${myTournamentsData[position].startDate?.toDate().day}/${myTournamentsData[position].startDate?.toDate().month}/"
                                  "${myTournamentsData[position].startDate?.toDate().year} to ${myTournamentsData[position].finalDate?.toDate().day}/"
                                  "${myTournamentsData[position].finalDate?.toDate().month}/${myTournamentsData[position].finalDate?.toDate().year}")
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
  
