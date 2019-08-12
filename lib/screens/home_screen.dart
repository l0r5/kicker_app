import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kicker_app/services/authentication_service.dart';
import 'package:kicker_app/utils/consts_utils.dart';
import '../states/Lobby.dart';
import '../states/User.dart';
import '../main.dart';
import '../utils/consts_utils.dart' as globals;
import 'elements/lobby_list_view.dart';

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
        body: Container(
            decoration: BoxDecoration(color: Colors.lightGreen),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(children: <Widget>[
                  Text(
                    'Kicker App',
                    style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: 100,
                    height: 100,
                    child: Image(image: AssetImage('assets/football.png')),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: RaisedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, globals.ROUTE_SINGLE_MATCH);
                      },
                      label: Text('Single Match'),
                      icon: Icon(Icons.videogame_asset),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Color(PRIMARY_COLOR),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                            ),
                          ]),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Lobby',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                        )),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                  child: LobbyListView(
                                    context: context,
                                    items: lobby.lobbyUsersSortedLoggedIn,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Text('Logged in as: ${user.email}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          )),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            width: 100,
                            child: RaisedButton(
                              onPressed: () {
                                _updateLobby();
                              },
                              child: Icon(Icons.refresh),
                            ),
                          ),
                        ],
                      )),
                ]))));
  }
}
