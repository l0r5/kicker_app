import 'package:flutter/material.dart';

import 'main.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/choose_teams_screen.dart';
import 'states/User.dart';
import 'utils/consts_utils.dart' as globals;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = getIt.get<User>();

    return MaterialApp(
        title: 'Test Title',
        theme: ThemeData(
            primaryColor: Color(0xff20a120),
            accentColor: Color(0xffa12020),
            textTheme: TextTheme(
              headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
              body2: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
              button: TextStyle(fontSize: 18.0),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Color(0xffa12020),
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(1)),
              padding: EdgeInsets.all(10),
              minWidth: 200.0,
              height: 42.0,
            )),
        routes: <String, WidgetBuilder>{
          globals.ROUTE_HOME: (context) => HomeScreen(),
          globals.ROUTE_LOGIN: (context) => LoginScreen(),
          globals.ROUTE_SINGLE_MATCH: (context) => ChooseTeamsScreen(),
        },
        home: Scaffold(
            body: (user.isLoggedIn == true ? HomeScreen() : LoginScreen())));
  }
}
