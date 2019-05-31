import 'package:flutter/material.dart';
import 'package:kicker_app/services/authentication.dart';
import '../states/Community.dart';
import '../states/User.dart';
import '../main.dart';
import '../utils/globals.dart' as globals;

class HomeScreen extends StatelessWidget {
  final user = getIt.get<User>();
  final community = getIt.get<Community>();
  final BaseAuth auth = getIt.get<Auth>();

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
                  Text('Username: ${user.email}'),
                  Text('Community: ${community.users}'),
                  RaisedButton(
                    onPressed: () {
                      auth.signOut();
                      user.setIsLoggedIn(false);
                      Navigator.pushReplacementNamed(
                          context, globals.ROUTE_LOGIN);
                    },
                    child: Text('Logout (isLoggedIn: ${user.isLoggedIn})'),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, globals.ROUTE_SINGLE_MATCH);
                        },
                        child: Text('Single Match'),
                      ))
                ]))));
  }
}
