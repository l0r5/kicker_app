import 'package:flutter/material.dart';

import 'state/Login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isLoggedIn = false;

  void _logOut() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    _isLoggedIn = Login.of(context) != null ? true : false;

    return Login(
      isLoggedIn: _isLoggedIn,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kicker App'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              _logOut();
//              Navigator.pop(context, '/login');
            },
            child: Text('Go Back'),
          ),
        ),
      ),
    );
  }
}
