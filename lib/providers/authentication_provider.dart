import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../firebase_functions.dart';
import '../models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider extends ChangeNotifier{

  late User? fireBaseUser;
  UserModel? userModel;

  AuthenticationProvider(){
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