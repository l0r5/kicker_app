import 'package:flutter/material.dart';

import '../states/Match.dart';
import '../main.dart';

class ResultScreen extends StatelessWidget {
  final match = getIt.get<Match>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Text('Team1   ${match.team1Goals} :${match.team2Goals}   Team2'),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                  'Player1: ${match.getPlayerNameByNumber(1)}, Goals: ${match.player1Goals}'),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                  'Player2: ${match.getPlayerNameByNumber(2)}, Goals: ${match.player2Goals}'),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                  'Player3: ${match.getPlayerNameByNumber(3)}, Goals: ${match.player3Goals}'),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                  'Player4: ${match.getPlayerNameByNumber(4)}, Goals: ${match.player4Goals}'),
            ],
          )

        ]));
  }
}
