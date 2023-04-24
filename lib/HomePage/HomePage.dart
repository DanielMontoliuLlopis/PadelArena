import 'package:flutter/material.dart';
import 'package:padel_arena/Services/LoadTournaments.dart';
import 'package:padel_arena/Services/UserService.dart';
import 'package:padel_arena/Tournaments/TournamentsList.dart';
import 'package:padel_arena/main.dart';
import 'package:padel_arena/profile/Profile.dart';

import '../Tournaments/CreateTournament.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  _HomePage createState()=>_HomePage();
}

class _HomePage extends State<HomePage>{
  int _selectedIndex=0;
  final List <Widget> _options= <Widget>[
      LoadTournaments(),
      Profile(),
  ];
  void _onItemTap(int index){
      setState((){
        _selectedIndex=index;
      });
  }
  @override
  Widget build(BuildContext context) {
    return (
       Scaffold(
        appBar: AppBar(
          title: const Text("Padel Arena"),
          centerTitle: true,
        ),
        body: _options.elementAt(_selectedIndex),
        floatingActionButton: _selectedIndex==0  ? FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateTournament()));
                  }, 
                  child: const Icon(Icons.add),
        ):null,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[BottomNavigationBarItem(icon: Icon(Icons.warning_amber_sharp), label: "Tournaments"),
                  BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile")
          ],
          onTap: _onItemTap,
          currentIndex: _selectedIndex,
        ),
        )
    );
  }
  
}