import 'package:flutter/material.dart';
import 'package:padel_arena/Services/UserService.dart';
import 'package:padel_arena/Tournaments/TournamentsList.dart';
import 'package:padel_arena/main.dart';
import 'package:padel_arena/profile/Profile.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  _HomePage createState()=>_HomePage();
}

class _HomePage extends State<HomePage>{
  int _selectedIndex=0;
  final List <Widget> _options= <Widget>[
      TournamentsList(),
      Profile(),
  ];
  void _onItemTap(int index){
      setState((){
        _selectedIndex=index;
      });
  }
  @override
  Widget build(BuildContext context) {
    //userData=UserService().getUserByEmail(email!);
    return (
       Scaffold(
        body: _options.elementAt(_selectedIndex),
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