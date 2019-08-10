import 'package:flutter/material.dart';
import 'package:kicker_app/states/User.dart';
import 'package:kicker_app/states/Lobby.dart';

import '../main.dart';
import 'elements/choose_player_button.dart';
import '../states/Match.dart';
import 'match_screen.dart';

class ChooseTeamsScreen extends StatefulWidget {
  @override
  _ChooseTeamsScreenState createState() {
    return _ChooseTeamsScreenState();
  }
}

class _ChooseTeamsScreenState extends State<ChooseTeamsScreen> {
  final user = getIt.get<User>();
  final match = getIt.get<Match>();
  final lobby = getIt.get<Lobby>();

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Teams'),
        ),
        body: Builder(
            builder: (context) => Container(
                decoration: BoxDecoration(color: Colors.lightGreen),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('User: ${user.email}')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ChoosePlayerButton(
                            playerNumber: 1,
                            availablePlayers: lobby.usersOnlineList,
                            notifyParent: refresh,
                          ),
                          ChoosePlayerButton(
                            playerNumber: 3,
                            availablePlayers: lobby.usersOnlineList,
                            notifyParent: refresh,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ChoosePlayerButton(
                            playerNumber: 2,
                            availablePlayers: lobby.usersOnlineList,
                            notifyParent: refresh,
                          ),
                          ChoosePlayerButton(
                            playerNumber: 4,
                            availablePlayers: lobby.usersOnlineList,
                            notifyParent: refresh,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              match.setTeams();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MatchScreen()));
                            },
                            child: Text('Start'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              'Team 1: ${match.getPlayerNameByNumber(1)} - ${match.getPlayerNameByNumber(2)}'
                              '\nTeam 2: ${match.getPlayerNameByNumber(3)} - ${match.getPlayerNameByNumber(4)}'),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
