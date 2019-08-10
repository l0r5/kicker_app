import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kicker_app/utils/consts_utils.dart';
import '../states/Match.dart';
import '../main.dart';
import '../utils/consts_utils.dart' as globals;
import 'elements/result_card.dart';

class ResultScreen extends StatelessWidget {
  final match = getIt.get<Match>();

  _saveMatch() {
    Firestore.instance.collection('matches').document().setData({
      'Player1': {
        'username': match.players[1]['playerName'],
        'goals': match.players[1]['playerGoals']
      },
      'Player2': {
        'username': match.players[2]['playerName'],
        'goals': match.players[2]['playerGoals']
      },
      'Player3': {
        'username': match.players[3]['playerName'],
        'goals': match.players[3]['playerGoals']
      },
      'Player4': {
        'username': match.players[4]['playerName'],
        'goals': match.players[4]['playerGoals']
      },
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
      body: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SingleChildScrollView(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Column(children: <Widget>[
                          ResultCard(
                            heightSize: RESULT_CARD_HEIGHT_SIZE_M,
                            title: 'Final Result',
                            body: Center(
                                child: Column(children: <Widget>[
                              Text('Team1 : Team2',
                                  style: Theme.of(context).textTheme.body1),
                              Text(
                                  '${match.getTeamGoalsByTeamNumber(1).toString()} : ${match.getTeamGoalsByTeamNumber(2).toString()}',
                                  style: Theme.of(context).textTheme.body1),
                            ])),
                          ),
                          ResultCard(
                            heightSize: RESULT_CARD_HEIGHT_SIZE_S,
                            title: 'Most Goals (last Game)',
                            body: Text('PlayerName 7'),
                          ),
                          ResultCard(
                            heightSize: RESULT_CARD_HEIGHT_SIZE_M,
                            title: 'Most Goals (current Season)',
                            body: Text('PlayerName 45'),
                          ),
                          ResultCard(
                            heightSize: RESULT_CARD_HEIGHT_SIZE_S,
                            title: 'Most Valuable Player',
                            body: Text('PlayerName'),
                          ),
                        ]),
                        Column(children: <Widget>[
                          ResultCard(
                              title: 'All Goals',
                              heightSize: RESULT_CARD_HEIGHT_SIZE_L,
                              body: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(children: <Widget>[
                                  Text(
                                      '${match.getPlayerNameByNumber(1)} ${match.getPlayerGoalsByPlayerNumber(1)}',
                                      style: Theme.of(context).textTheme.body1),
                                  Text(
                                      '${match.getPlayerNameByNumber(2)} ${match.getPlayerGoalsByPlayerNumber(2)}',
                                      style: Theme.of(context).textTheme.body1),
                                  Text(
                                      '${match.getPlayerNameByNumber(3)} ${match.getPlayerGoalsByPlayerNumber(3)}',
                                      style: Theme.of(context).textTheme.body1),
                                  Text(
                                      '${match.getPlayerNameByNumber(4)} ${match.getPlayerGoalsByPlayerNumber(4)}',
                                      style: Theme.of(context).textTheme.body1)
                                ]),
                              )),
                          ResultCard(
                            heightSize: RESULT_CARD_HEIGHT_SIZE_S,
                            title: 'Most Goals (all times)',
                            body: Text('PlayerName 7'),
                          ),
                          ResultCard(
                              title: 'Best performing Teams',
                              heightSize: RESULT_CARD_HEIGHT_SIZE_XL,
                              body: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(children: <Widget>[
                                  Text('Team: PlayerName PlayerName Wins: 39',
                                      style: Theme.of(context).textTheme.body1),
                                  Text('Team: PlayerName PlayerName Wins: 35',
                                      style: Theme.of(context).textTheme.body1),
                                ]),
                              )),
                        ]),
                      ])))),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _saveMatch();
          _resetMatch();
          Navigator.of(context).pushNamedAndRemoveUntil(
              globals.ROUTE_HOME, (Route<dynamic> route) => false);
        },
        icon: Icon(Icons.save),
        label: Text('Save'),
      ),
    );
  }
}
