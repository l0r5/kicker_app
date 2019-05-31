import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../states/Match.dart';
import '../main.dart';
import '../utils/globals.dart' as globals;

class ResultScreen extends StatelessWidget {
  final match = getIt.get<Match>();

  _saveMatch() {
    Firestore.instance.collection('matches').document().setData({
      'id': '1',
      'team1Names': match.team1Names,
      'team2Names': match.team2Names,
      'team1Goals': match.team1Goals,
      'team2Goals': match.team2Goals,
      'player1Name': match.player1Name,
      'player2Name': match.player2Name,
      'player3Name': match.player3Name,
      'player4Name': match.player4Name,
      'player1Goals': match.player1Goals,
      'player2Goals': match.player2Goals,
      'player3Goals': match.player3Goals,
      'player4Goals': match.player4Goals,
    });
  }

  _resetMatch() {
    match.reset();
  }

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
                  'Player1: ${match.getPlayerNameByNumber(1)}, Goals: ${match
                      .player1Goals}'),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                  'Player2: ${match.getPlayerNameByNumber(2)}, Goals: ${match
                      .player2Goals}'),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                  'Player3: ${match.getPlayerNameByNumber(3)}, Goals: ${match
                      .player3Goals}'),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                  'Player4: ${match.getPlayerNameByNumber(4)}, Goals: ${match
                      .player4Goals}'),
            ],
          ),
          Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _saveMatch();
                    _resetMatch();
                    Navigator.of(context).pushNamedAndRemoveUntil(globals.ROUTE_HOME, (Route<dynamic> route) => false);
                  },
                  child: Text('Save'),
                )
              ]
          )
          ,
        ]
        )
    );
  }
}
