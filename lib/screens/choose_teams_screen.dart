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
          title: Text('Assemble Teams'),
        ),
        body: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/soccer-field.png',
              fit: BoxFit.fill,
            ),
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
          ),
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                        margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Team 1',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w300),
                            ),
                            Text('${match.getPlayerName(1)}'),
                            Text('${match.getPlayerName(2)}')
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                        margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Team 2',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w300),
                              ),
                              Text('${match.getPlayerName(3)}'),
                              Text('${match.getPlayerName(4)}')
                            ]))
                  ])),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: ChoosePlayerButton(
                        playerNumber: 1,
                        availablePlayers: lobby.getLobbyUserNames,
                        notifyParent: refresh,
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: ChoosePlayerButton(
                        playerNumber: 3,
                        availablePlayers: lobby.getLobbyUserNames,
                        notifyParent: refresh,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: ChoosePlayerButton(
                        playerNumber: 2,
                        availablePlayers: lobby.getLobbyUserNames,
                        notifyParent: refresh,
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: ChoosePlayerButton(
                      playerNumber: 4,
                      availablePlayers: lobby.getLobbyUserNames,
                      notifyParent: refresh,
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: RaisedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MatchScreen()));
                        },
                        label: Text('Start'),
                        icon: Icon(Icons.directions_run)),
                  ))),
        ]));
  }
}
