import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'login_screen.dart';
import 'main.dart';
import 'states/Login.dart';
import 'utils/globals.dart' as globals;

class App extends StatelessWidget {
  final login = getIt.get<Login>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          globals.ROUTE_HOME: (context) => HomeScreen(),
          globals.ROUTE_LOGIN: (context) => LoginScreen(),
        },
        home: Scaffold(
            body: StreamBuilder(
                stream: login.stream$,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  return snap.data == true ? HomeScreen() : LoginScreen();
                })));
  }
}
