import 'package:flutter/material.dart';
import 'package:app_motorista/model/home/HomeModel.dart';

class HomePageState extends HomeModel {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    
    List<Widget> menu = <Widget>[
    new IconButton(
      icon: new Icon(Icons.send),
      tooltip: 'To Example 2',
      //onPressed: () => _toExample2(context),
    ),
    new IconButton(
      icon: new Icon(Icons.help),
      tooltip: 'To Example 3',
      //onPressed: () => _toExample3(context),
    )
  ];


  Widget middleSection = new Expanded(
    child: new Container (
      padding: new EdgeInsets.all(8.0),
      color: Colors.black,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Text('Some data here'),
          new Text('More stuff here'),
        ],
      ),
    ),
  );

  Widget bottomBanner = new Container (
    padding: new EdgeInsets.all(8.0),
    height: 380.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.white, //                   <--- border color
          width: 5.0,
        ),
    ),
    child: new Container(
      child: Column(
        children: <Widget>[
          new Text('Some data here', style: TextStyle(color: Colors.black)),
          new Text('More stuff here', style: TextStyle(color: Colors.black, fontSize: 40)),
        ],
      )
    ),
  );

  Widget body = new Column(
    // This makes each child fill the full width of the screen
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      middleSection,
      bottomBanner,
    ],
  );

  return new Scaffold(
    appBar: AppBar(
        elevation: 0.0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true
    ),
    body: new Padding(
      padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: body,
    ),
  );
  }

}