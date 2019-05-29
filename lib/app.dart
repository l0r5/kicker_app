import 'package:flutter/material.dart';

import 'main.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/choose_teams_screen.dart';
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
          globals.ROUTE_SINGLE_MATCH: (context) => ChooseTeamsScreen(),
        },
        home: Scaffold(
            body: (login.isLoggedIn == true ? HomeScreen() : LoginScreen())));
  }
}
