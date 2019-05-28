import 'package:flutter/material.dart';

import '../../states/Match.dart';
import '../../main.dart';

class PlayerButton extends StatefulWidget {
  final playerNumber;
  final playerName;

  const PlayerButton({this.playerNumber, this.playerName});

  @override
  _PlayerButtonState createState() {
    return _PlayerButtonState(playerNumber, playerName);
  }
}

class _PlayerButtonState extends State<PlayerButton> {
  final match = getIt.get<Match>();
  final playerNumber;
  final playerName;

  _PlayerButtonState(this.playerNumber, this.playerName);

  _displaySnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(content: Text(msg));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _setButtonText() {
    return Text('Player$playerNumber');
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        match.setPlayerName(playerNumber, playerName);
        _displaySnackBar(context, 'Player$playerNumber $playerName');
      },
      child: _setButtonText(),
    );
  }
}
