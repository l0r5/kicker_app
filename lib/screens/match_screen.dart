import 'package:flutter/material.dart';

import '../states/Match.dart';
import '../main.dart';
import 'elements/player_controls.dart';

class MatchScreen extends StatelessWidget {

  final match = getIt.get<Match>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Match'),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.lightGreen),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  PlayerControls(
                    playerNumber: 1,
                    playerName:match.playerName1,
                  ), PlayerControls(
                    playerNumber: 3,
                    playerName:match.playerName3,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  PlayerControls(
                    playerNumber: 2,
                    playerName:match.playerName2,),
                  PlayerControls(
                    playerNumber: 4,
                    playerName:match.playerName4,)
                ],
              ),
            ],
          ),
        ));
  }
}
