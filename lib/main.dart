import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('hey I am here!'),
        ),
        body: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {},
              child: Text("Add product")
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Image.asset('assets/profile.jpeg'),
                Text('Food Paradise')
              ],
            ),
          ),
        ]),
      )
    );
  }
}
