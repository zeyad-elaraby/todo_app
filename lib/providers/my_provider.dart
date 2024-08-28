import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_functions.dart';
import '../models/userModel.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  Future<void> changeTheme(ThemeMode themeMode) async {
    mode = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isdark', mode == ThemeMode.dark);

    notifyListeners();
  }

  late User? fireBaseUser;
   UserModel? userModel;

  MyProvider(){
    fireBaseUser=FirebaseAuth.instance.currentUser;
    if(fireBaseUser!=null){
      initUser();
    }
  }

  initUser()async{
    userModel =await  FirebaseFunctions.readUser();
    notifyListeners();

  }
}
