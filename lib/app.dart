import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'login_screen.dart';
import 'state/Login.dart';
import 'utils/globals.dart' as globals;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _initialRoute = globals.ROUTE_LOGIN;

    if(Login.of(context) != null) {
      if(Login.of(context).isLoggedIn) {
        _initialRoute = globals.ROUTE_HOME;
      }
    }

    return MaterialApp(
//        initialRoute: _initialRoute,
        routes: <String, WidgetBuilder>{
          globals.ROUTE_HOME: (context) => HomeScreen(),
          globals.ROUTE_LOGIN: (context) => LoginScreen(),
        },
        home: Scaffold(
          body: _initialRoute == globals.ROUTE_HOME ? HomeScreen() : LoginScreen()
        )
    );
  }
}