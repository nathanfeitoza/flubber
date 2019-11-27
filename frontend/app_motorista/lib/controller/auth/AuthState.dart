import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'package:app_motorista/model/auth/AuthModel.dart';
import 'package:app_motorista/model/auth/PhoneAuthentication.dart';


class AuthState extends AuthModel {
	int counter = 0;
	
	final telefone = TextEditingController();

	@override
	void dispose() {
		// Clean up the controller when the widget is disposed.
		telefone.dispose();
		super.dispose();
	}

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


		Widget middleSection = new Expanded(
			child: new Container (
			padding: new EdgeInsets.all(8.0),
			color: Colors.white,
			child: new Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: <Widget>[
					new Text(
						'Para continuar digite seu telefone abaixo', 
						style: TextStyle(color: Colors.black, fontSize: 18),
					),
					 new TextField(
						decoration: new InputDecoration(labelText: "Seu Telefone"),
						keyboardType: TextInputType.phone,
						controller: telefone,
					),
					new Text(telefone.text)
				],
			),
			),
		);

		Widget bottomBanner = new Container (
			padding: new EdgeInsets.all(0.0),
			height: 45.0,
			color: Colors.black,
			child: new Container(
			padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					FlatButton(
						materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
						onPressed: () {
							PhoneAuthentication(context: context, phoneNumber: telefone.text);
						},
						color: Colors.black,
						//padding: EdgeInsets.all(8.0),
						child: Column( // Replace with a Row for horizontal icon + text
						children: <Widget>[
							Text(
							"Continuar", 
							style: TextStyle(color: Colors.white, fontSize: 18)
							)
						],
						),
					),
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