import 'package:firebaseauth/services/auth.dart';
import 'package:firebaseauth/shared/loading.dart';
import 'package:firebaseauth/shared/widget.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({Key key, this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AutheService _auth = AutheService();
  
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // text field state
    
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text("Sing up to FireBase"),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text("Sign In"))
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
                child: Column(children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:"Email"),
                validator: (val) =>  val.isEmpty ?"Entre com o email" : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Senha" ),
                  validator: (val) =>  val.length < 6 ?"Sua senha devera ter 6 digitos" : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                if(_formKey.currentState.validate()){
                  setState(() => loading = true);
                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                  if(result == null){
                   setState(() => error = "Prencha os campos corretamente ");
                   setState(() => loading = false);
                   }
                }
                }
                  ),
                  SizedBox(height: 12.0,),
                  Text(error,
                  style: TextStyle(color: Colors.red,fontSize: 14.0),
                  ),

                  ]
                  )
                  )
                  )
                  );

  }
}