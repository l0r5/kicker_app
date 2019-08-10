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
                              Text('${match.team1Goals} : ${match.team2Goals}',
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
                                      '${match.player1Name} ${match.player1Goals}',
                                      style: Theme.of(context).textTheme.body1),
                                  Text(
                                      '${match.player2Name} ${match.player2Goals}',
                                      style: Theme.of(context).textTheme.body1),
                                  Text(
                                      '${match.player3Name} ${match.player3Goals}',
                                      style: Theme.of(context).textTheme.body1),
                                  Text(
                                      '${match.player4Name} ${match.player4Goals}',
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
          Navigator.of(context).pushNamedAndRemoveUntil(globals.ROUTE_HOME, (Route<dynamic> route) => false);
        },
        icon: Icon(Icons.save),
        label: Text('Save'),
      ),
    );
  }
}
