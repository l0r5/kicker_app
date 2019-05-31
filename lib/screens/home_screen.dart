import 'package:flutter/material.dart';
import 'package:kicker_app/services/authentication_service.dart';
import 'package:kicker_app/services/community_service.dart';
import '../states/Community.dart';
import '../states/User.dart';
import '../main.dart';
import '../utils/globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final user = getIt.get<User>();
  final community = getIt.get<Community>();
  final BaseAuthenticationService authenticationService =
      getIt.get<AuthenticationService>();
  final CommunityService communityService = getIt.get<CommunityService>();

  _updateCommunity() async {
    await communityService
        .getOnlineUsers()
        .then((updatedOnlineUsers) => updatedOnlineUsers.forEach((user) {
              community.addUser(user);
              setState(() {});
            }));
  }

  @override
  Widget build(BuildContext context) {
    _updateCommunity();

    return Scaffold(
        appBar: AppBar(
          title: Text('Kicker App'),
        ),
        body: Center(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40),
                child: Column(children: <Widget>[
                  Text('Email: ${user.email}'),
                  Text('Community: ${community.users}'),
                  RaisedButton(
                    onPressed: () {
                      authenticationService.signOut();
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
