import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kicker_app/services/authentication_service.dart';
import '../states/Lobby.dart';
import '../states/User.dart';
import '../main.dart';
import '../utils/consts_utils.dart' as globals;
import 'elements/lobby_list_view.dart';
import 'home_page.dart';

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

  _updateLobby() async {
    List<String> storedUsers = [];
    await Firestore.instance.collection('users').getDocuments().then((users) {
      users.documents.forEach((document) {
        String uid = document.data['uid'];
        var username = document.data['username'];
        var email = document.data['email'];
        var isLoggedIn = document.data['isLoggedIn'];
        Map<String, Object> user = {
          'uid': uid,
          'username': username,
          'email': email,
          'isLoggedIn': isLoggedIn
        };
        lobby.addUser(user);
      });
    });
    setState(() {});
  }

  _quitLobbySession() async {
    await Firestore.instance
        .collection('users')
        .document(user.uid)
        .updateData({'isLoggedIn': false});
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                print('Logging out ${user.email}');
                authenticationService.signOut();
                _quitLobbySession();
                _resetGlobalStates();
                Navigator.pushReplacementNamed(context, globals.ROUTE_LOGIN);
              },
            )
          ],
        ),
        body: PageView(
          children: <Widget>[
            Container(
              color: Colors.pink,
              child: HomePage(
                  sortedLobbyUsers: lobby.lobbyUsersSortedLoggedIn,
                  userEmail: user.email,
                  updateLobby: _updateLobby),
            ),
            Container(
              color: Colors.cyan,
            ),
            Container(
              color: Colors.deepPurple,
            ),
          ],
        )
        );
  }
}
