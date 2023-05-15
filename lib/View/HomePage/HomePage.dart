import 'package:flutter/material.dart';
import 'package:padel_arena/Services/LoadTournaments.dart';
import 'package:padel_arena/View/Tournaments/MyTournaments.dart';
import 'package:padel_arena/View/profile/Profile.dart';

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
      MyTournaments(),
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
          items: const <BottomNavigationBarItem>[BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: "Tournaments"),
                  BottomNavigationBarItem(icon: Icon( Icons.event_available_rounded), label: "My Tournaments"),
                  BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile")
          ],
          onTap: _onItemTap,
          currentIndex: _selectedIndex,
        ),
        )
    );
  }
  
}