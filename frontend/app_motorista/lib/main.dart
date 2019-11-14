import 'package:flutter/material.dart';
import 'package:app_motorista/controller/home/HomeState.dart';
import 'package:app_motorista/controller/home/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const int _blackPrimaryValue = 0xFF000000;
    const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

    return MaterialApp(
      title: 'Flubber',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: primaryBlack,   
        canvasColor: Color(0xff30363b),
            textTheme: TextTheme
            (
               //default text style
                body1: TextStyle( color: Colors.white ),
                body2: TextStyle( color: Colors.white ),
            ),
      ),
      home: HomePage(title: 'Flubber'),
    );
  }
}

