import 'package:flutter/material.dart';

import '../states/Match.dart';
import '../main.dart';
import 'elements/player_controls.dart';
import 'result_screen.dart';

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() {
    return _MatchScreenState();
  }
}

class _MatchScreenState extends State<MatchScreen> {
  final match = getIt.get<Match>();

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Match'),
        ),
        body: Container(
            decoration: BoxDecoration(color: Colors.lightGreen),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                      'Team1   ${match.team1Goals} :${match.team2Goals}   Team2')
                ],
              ),
              Row(
                children: <Widget>[
                  PlayerControls(
                    playerNumber: 1,
                    playerName: match.player1Name,
                    notifyParent: refresh,
                  ),
                  PlayerControls(
                    playerNumber: 3,
                    playerName: match.player3Name,
                    notifyParent: refresh,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  PlayerControls(
                    playerNumber: 2,
                    playerName: match.player2Name,
                    notifyParent: refresh,
                  ),
                  PlayerControls(
                    playerNumber: 4,
                    playerName: match.player4Name,
                    notifyParent: refresh,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
                    },
                    child: Text('FINISH'),
                  ),
                ],
              ),
            ])));
  }
}
