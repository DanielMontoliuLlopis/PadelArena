import 'package:flutter/material.dart';
import 'package:padel_arena/View/Tournaments/TournamentPage.dart';
import 'package:padel_arena/generated/l10n.dart';
import 'package:padel_arena/main.dart';

class TournamentsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TournamentsList();
}

class _TournamentsList extends State<TournamentsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: tournamentsData.length,
          itemBuilder: (context, position) {
            return Card(
                borderOnForeground: true,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  tileColor: Colors.amber,
                  title: Text(
                    tournamentsData[position].name!.toUpperCase(),
                    style: const  TextStyle(letterSpacing: 2, height: 0.5),
                  ),
                  trailing: IconButton(
                    icon: tournamentsData[position].expanded
                        ? const Icon(Icons.keyboard_arrow_up_sharp)
                        : const Icon(Icons.keyboard_arrow_down_sharp),
                    onPressed: () => {
                      setState(() => {
                            tournamentsData[position].expanded =
                                !tournamentsData[position].expanded
                          })
                    },
                    padding: EdgeInsets.all(6.0),
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
                                  "${tournamentsData[position].location}\n"),
                              Text(
                                  "${S.current.from} ${tournamentsData[position].startDate?.toDate().day}/${tournamentsData[position].startDate?.toDate().month}/"
                                  "${tournamentsData[position].startDate?.toDate().year} ${S.current.to} ${tournamentsData[position].finalDate?.toDate().day}/"
                                  "${tournamentsData[position].finalDate?.toDate().month}/${tournamentsData[position].finalDate?.toDate().year}")
                            ],
                          )),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                ));
          }),
    );
  }
}
