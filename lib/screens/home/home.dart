import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebaseauth/models/firebase.dart';
import 'package:firebaseauth/screens/authenticate/authenticate.dart';
import 'package:firebaseauth/screens/home/firebase_list.dart';
import 'package:firebaseauth/services/auth.dart';
import 'package:firebaseauth/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebaseauth/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AutheService _auth = AutheService();

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    setupNotification();
  }

  void setupNotification() async {
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
     showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text("Almedinha peidinho"),
            );
          });
      print("Message onMessage: $message");
    }, onResume: (Map<String, dynamic> message) async {
      print("Message onResume: $message");
    }, onLaunch: (Map<String, dynamic> message) async {
      print("Message onLaunch: $message");
    });
  }

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text("Bottom sheet"),
            );
          });
    }

    return StreamProvider<List<FireBase>>.value(
      value: DataBaseService().fireBase,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("FireBase"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text("Logout"),
            ),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text("Settings"))
          ],
        ),
        // body: FireBaseList(),
      ),
    );
  }
}
