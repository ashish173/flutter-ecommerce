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

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
      fit: BoxFit.cover,
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'E-mail', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.text,
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;
        });
      },
    );
  }

  Widget _buildAcceptTermsField() {
    return SwitchListTile(
      value: _acceptTerms,
      title: Text('Accept Terms'),
      onChanged: (bool newValue) {
        setState(() {
          _acceptTerms = newValue;
        });
      },
    );
  }

  void _submitForm() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 700.0 ? 500.0 : deviceWidth * 0.95;

    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: deviceWidth > 700.0 ? 500.0 : targetWidth,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(height: 10.0),
                    _buildPasswordTextField(),
                    _buildAcceptTermsField(),
                    RaisedButton(
                      child: Text('LOGIN'),
                      onPressed: _submitForm,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
