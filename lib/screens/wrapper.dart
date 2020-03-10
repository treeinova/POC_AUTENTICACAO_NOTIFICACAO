import 'package:firebaseauth/models/user.dart';
import 'package:firebaseauth/screens/authenticate/authenticate.dart';
import 'package:firebaseauth/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    

    // return either Home or Authenticate widget 
  if ( user == null) {
    return Authenticate();

  }else{
    return Home();
  }
      
  }
}