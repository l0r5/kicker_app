import 'package:flutter/material.dart';
import 'package:kicker_app/services/authentication_service.dart';
import 'package:kicker_app/services/lobby_service.dart';
import '../states/Lobby.dart';
import '../states/User.dart';
import '../main.dart';
import '../utils/globals_utils.dart' as globals;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final user = getIt.get<User>();
  final lobby = getIt.get<Lobby>();
  final BaseAuthenticationService authenticationService =
      getIt.get<AuthenticationService>();
  final LobbyService lobbyService = getIt.get<LobbyService>();

  _updateLobby() async {
    await lobbyService.getOnlineUsers().then((onlineUsers) {
      print(onlineUsers.toString());
      onlineUsers.forEach((user) {
        lobby.addUser(user);
        setState(() {});
      });
    });
  }

  @override
  initState() {
    super.initState();
    _updateLobby();
  }

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
                  Text('Email: ${user.email}'),
                  Text('Community: ${lobby.usersOnline}'),
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
                          _updateLobby();
                        },
                        child: Text('Refresh Lobby'),
                      )),
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
