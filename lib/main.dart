import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _products = ['Food tester'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('hey I am here!'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  _products.add("Advanced food tester");                                  
                });
              }, 
              child: Text("Add product")),
          ),
          Column(children: _products.map((element) => Card(
            child: Column(
              children: <Widget>[
                Image.asset('assets/profile.jpeg'),
                Text(element)
              ],
            ),
          ),).toList(),)
      ]),
    ));
  }
}
