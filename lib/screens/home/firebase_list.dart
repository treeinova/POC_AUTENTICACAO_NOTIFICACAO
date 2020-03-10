import 'package:firebaseauth/models/firebase.dart';
import 'package:firebaseauth/screens/home/firabase_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FireBaseList extends StatefulWidget {
  @override
  _FireBaseListState createState() => _FireBaseListState();
}

class _FireBaseListState extends State<FireBaseList> {
  @override
  Widget build(BuildContext context) {

    final firebase = Provider.of<List<FireBase>>(context);
 


    return ListView.builder(
      itemCount: firebase?.length,
      itemBuilder:(context, index){
        return  FireBaseTile(fireBase :firebase[index]);


      }
    );
      
   
  }
}