import 'package:flutter/material.dart';

import 'main.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/choose_teams_screen.dart';
import 'states/User.dart';
import 'utils/consts_utils.dart' as globals;
import 'utils/consts_utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = getIt.get<User>();

    return MaterialApp(
        title: 'Test Title',
        theme: ThemeData(
            primaryColor: Color(PRIMARY_COLOR),
            accentColor: Color(ACCENT_COLOR),
            textTheme: TextTheme(
              headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              title: TextStyle(fontSize: 38.0),
              body1: TextStyle(fontSize: 14.0),
              body2: TextStyle(fontSize: 12.0),
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
