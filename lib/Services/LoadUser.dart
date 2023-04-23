import 'package:flutter/material.dart';
import '../HomePage/HomePage.dart';
import '../Model/UserData.dart';
import '../main.dart';
import 'UserService.dart';

class LoadUser extends StatelessWidget{
  Future<UserData> user=UserService().getUserByEmail(email!);

  LoadUser({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: user,
    builder: ( context,  snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(),);
      }
      userData=snapshot.data;
      return const HomePage();
    });
  }

}