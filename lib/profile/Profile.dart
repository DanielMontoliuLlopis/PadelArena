import 'package:flutter/cupertino.dart';
import 'package:padel_arena/main.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return(
        Center(child: Text("${userData.userName}"),)
      );
  }

}