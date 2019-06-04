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
      lobby.setUsersOnline(onlineUsers);
      print('Local Lobby Online Users: ${lobby.usersOnlineList}');
      setState(() {
        });
    });
  }

  _quitLobbySession() async {
    await lobbyService.removeOnlineUser(user.email).then((onlineUsers) {
      print('Local Lobby Online Users: ${lobby.usersOnlineList}');
    });
  }

  @override
  initState() {
    super.initState();
    _updateLobby();
  }

  _resetGlobalStates() {
    lobby.reset();
    user.reset();
    print('Global States resetted.');
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
                  Text('Lobby: ${lobby.usersOnlineList}'),
                  RaisedButton(
                    onPressed: () {
                      print('Logging out ${user.email}');
                      authenticationService.signOut();
                      _quitLobbySession();
                      _resetGlobalStates();
                      Navigator.pushReplacementNamed(
                          context, globals.ROUTE_LOGIN);
                    },
                    child: Text('Logout'),
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
