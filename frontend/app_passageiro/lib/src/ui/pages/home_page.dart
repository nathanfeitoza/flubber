import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String uid = '';

  getUid() {}

  @override
  void initState() {
    this.uid = '';
    FirebaseAuth.instance.currentUser().then((val) {
      setState(() {
        this.uid = val.uid;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("HomePage"),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Agora você está logado como ${uid}"),
              // SizedBox(
              //   height: 15.0,
              // ),
              new OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.blueAccent,
                      style: BorderStyle.solid,
                      width: 3.0),
                  child: Text("Sair"),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((action) {
                      Navigator.of(context).pushReplacementNamed("/");
                    }).catchError((e) {
                      print(e);
                    });
                  })
            ],
          ),
        )));
  }
}
