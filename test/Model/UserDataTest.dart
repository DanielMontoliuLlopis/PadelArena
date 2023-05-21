

import 'dart:js_util';

import 'package:flutter_test/flutter_test.dart';
import 'package:padel_arena/Model/UserData.dart';

void main() {
  UserData createUser(){
    return UserData("Daniel", "daniel@gmail.com", "Daniel", "Montoliu", "", true);
  }

  Map<String,dynamic> createMap(){
     Map <String, dynamic> value={
      'username': "Daniel",
      'first_name':"Daniel",
      'last_name':"Montoliu",
      'email':"daniel@gmail.com",
      'url_image':"",
      'verified':true,
    };
    return value;
  }
  test("sould get the userData correctly created from map", (){
    UserData userTest=UserData.constructorFromMap(createMap());

    expect(userTest.email, createUser().email);
  });



  test("sould get the userData correctly created from user", (){
    Map<String, dynamic> value=createUser().toMap();

    expect(value, createMap());
  });
}