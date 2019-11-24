import 'package:flutter/material.dart';
import 'package:app_passageiro/src/ui/pages/login.dart';
import 'package:app_passageiro/src/ui/pages/home_page.dart';

void main() => runApp(FlubberApp());

class FlubberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flubber",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => HomePage(),
        '/': (context) => LoginView(),
      },
    );
  }
}
