import 'package:flutter/material.dart';

import './products.dart';

class AuthPage extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _AuthPageState();
    }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String value) {
                      setState(() {
                        _emailValue = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    keyboardType: TextInputType.text,
                    onChanged: (String value) {
                      setState(() {
                        _passwordValue = value;
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('LOGIN'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ],
              ),  
            ),
          ),
        ));
  }
}
