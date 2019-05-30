import 'package:flutter/material.dart';
import 'package:kicker_app/states/User.dart';
import 'package:kicker_app/states/Community.dart';

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
  final community = getIt.get<Community>();

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
                    Row(children: <Widget>[Text('Username: ${user.userName}')]),
                    Row(
                      children: <Widget>[
                        ChoosePlayerButton(
                          playerNumber: 1,
                          availablePlayers: community.usersList,
                          notifyParent: refresh,
                        ),
                        ChoosePlayerButton(
                          playerNumber: 3,
                          availablePlayers: community.usersList,
                          notifyParent: refresh,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        ChoosePlayerButton(
                          playerNumber: 2,
                          availablePlayers: community.usersList,
                          notifyParent: refresh,
                        ),
                        ChoosePlayerButton(
                          playerNumber: 4,
                          availablePlayers: community.usersList,
                          notifyParent: refresh,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            match.setTeams();
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('START')));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MatchScreen()));
                          },
                          child: Text('START'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                            'Team 1: ${match.getPlayerNameByNumber(1)} - ${match.getPlayerNameByNumber(2)}'
                            '\nTeam 2: ${match.getPlayerNameByNumber(3)} - ${match.getPlayerNameByNumber(4)}'),
                      ],
                    ),
                  ],
                ))));
  }
}