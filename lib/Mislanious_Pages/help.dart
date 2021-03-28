import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(MyApp());

_makingPhoneCall() async {
const url = 'tel:7978578168';
if (await canLaunch(url)) {
	await launch(url);
} else {
	throw 'Could not launch $url';
}
}

class help extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<help> {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		appBar: AppBar(
      centerTitle: true,
		title: Text('Help and Support'),
		backgroundColor: Colors.green,
		),
		body: SafeArea(
		child: Center(
			child: Column(
			children: [
				Container(
				height: 250.0,
				),
				Text(
				'Contact our Customer care agent',
				style: TextStyle(
					fontSize: 20.0,
					color: Colors.green,
					fontWeight: FontWeight.bold,
				),
				),
				Container(
				height: 20.0,
				),
				Text(
				'For any Quary',
				style: TextStyle(
					fontSize: 20.0,
					color: Colors.green,
					fontWeight: FontWeight.bold,
				),
				),
				Container(
				height: 20.0,
				),
				RaisedButton(
				onPressed: _makingPhoneCall,
				child: Text('Call'),
				textColor: Colors.black,
				padding: const EdgeInsets.all(5.0),
				),
			],
			),
		),
		),
	),
	);
}
}
