import 'package:flutter/material.dart';

import '../main.dart';
import '../states/Login.dart';
import '../utils/globals.dart' as globals;

class HomeScreen extends StatelessWidget {
  final login = getIt.get<Login>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kicker App'),
        ),
        body: Center(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40),
                child: Column(children: <Widget>[
                  StreamBuilder(
                      stream: login.stream$,
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        return RaisedButton(
                          onPressed: () {
                            login.logOut();
                            Navigator.pushReplacementNamed(
                                context, globals.ROUTE_LOGIN);
                          },
                          child: Text('Logout (isLoggedIn: ${snap.data})'),
                        );
                      }),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          login.logIn();
                          Navigator.pushNamed(
                              context, globals.ROUTE_SINGLE_MATCH);
                        },
                        child: Text('Single Match'),
                      ))
                ]))));
  }
}
