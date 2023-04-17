import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:padel_arena/Model/UserData.dart';

class UserService{
  
  final db=FirebaseFirestore.instance;
  final ref=FirebaseDatabase.instanceFor(app:Firebase.app(), databaseURL: "https://padel-arena-5b4cb-default-rtdb.europe-west1.firebasedatabase.app" ).ref();
  saveUser(UserData user){
    db.collection("Users").add(user.toMap());
  }

  /*getUserByName(String name) async{
    DataSnapshot snapshot=await ref.child('Users/$name').get();
    if(snapshot.exists){
      UserData userData=UserData.constructorFromMap(snapshot.value);
      return userData;
    }
  }*/

  getAllUsersDocuments() async{
    List<UserData> list=[];
   await db.collection("Users").get().then((event) => {
      for(var co in event.docs){
        list.add(UserData.constructorFromMap(co.data()))
      }
   });
   return list;
  }
prueba () async{
    UserService().getAllUsersDocuments().then((list)=>{
        for(UserData u in list ){
             print(u.email)
          }
    });    
  }
}