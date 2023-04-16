import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:padel_arena/Model/UserData.dart';

class UserService{
  saveUser(UserData user){
    FirebaseDatabase.instance.ref().child('Users').push().set(user.toMap());
  }
}