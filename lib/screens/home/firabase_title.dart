
import 'package:firebaseauth/models/firebase.dart';
import 'package:flutter/material.dart';

class FireBaseTile extends StatelessWidget {
  
  final FireBase fireBase;

 FireBaseTile({this.fireBase});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 8.0),
    child: Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: ListTile(
        leading: CircleAvatar(
          radius:  25.0,
          backgroundColor: Colors.brown[fireBase.strength],
        ),
        title: Text(fireBase.name),
        subtitle: Text("Takes ${fireBase.sugars}(s)"),
      ),
    ),
      
    );
  }
}