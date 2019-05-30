import 'package:flutter/material.dart';

class PlayerControls extends StatefulWidget {

  final playerNumber;
  final playerName;

  PlayerControls({this.playerNumber, this.playerName});

  @override
  _PlayerControlsState createState() {
    return _PlayerControlsState(playerNumber, playerName);
  }
}

class _PlayerControlsState extends State<PlayerControls> {

  final playerNumber;
  final playerName;

  _PlayerControlsState(this.playerNumber, this.playerName);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Goal! +1 for Player$playerNumber: $playerName')));
            },
            child: Text('+'),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Text('$playerName'),
        ],
      ),
      Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Remove one Goal from Player$playerNumber: $playerName')));
            },
            child: Text('-'),
          ),
          RaisedButton(
            onPressed: () {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Own Goal for Player$playerNumber: $playerName')));
            },
            child: Text('ET'),
          ),
        ],
      )
    ]);
  }
}
