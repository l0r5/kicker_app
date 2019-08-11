import 'package:flutter/material.dart';

import '../../main.dart';
import '../../states/Match.dart';

class PlayerControls extends StatefulWidget {
  final playerNumber;
  final playerName;
  final Function() notifyParent;

  PlayerControls({this.playerNumber, this.playerName, this.notifyParent});

  @override
  _PlayerControlsState createState() {
    return _PlayerControlsState();
  }
}

class _PlayerControlsState extends State<PlayerControls> {
  final match = getIt.get<Match>();
  List<int> teamGoals = [0, 0];

  _addGoalToPlayer() {
    int playerGoals = match.getPlayerGoals(widget.playerNumber) + 1;
    int teamGoals =
        match.getTeamGoals(match.getTeamNumber(widget.playerNumber)) + 1;
    match.setPlayerGoals(widget.playerNumber, playerGoals);
    match.setTeamGoals(match.getTeamNumber(widget.playerNumber), teamGoals);
  }

  _removeGoalFromPlayer() {
    int playerGoals = match.getPlayerGoals(widget.playerNumber);
    if (playerGoals > 0) {
      playerGoals--;
    }
    int teamGoals =
        match.getTeamGoals(match.getTeamNumber(widget.playerNumber));
    if (teamGoals > 0) {
      teamGoals--;
    }
    match.setPlayerGoals(widget.playerNumber, playerGoals);
    match.setTeamGoals(match.getTeamNumber(widget.playerNumber), teamGoals);
  }

  _addOwnGoal() {
    switch (match.getTeamNumber(widget.playerNumber)) {
      case 1:
        match.setTeamGoals(2, match.getTeamGoals(2) + 1);
        break;
      case 2:
        match.setTeamGoals(1, match.getTeamGoals(1) + 1);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        height: 160,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50,
              top: 0,
              width: 50,
              height: 50,
              child: FlatButton(
                onPressed: () {
                  _addGoalToPlayer();
                  widget.notifyParent();
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Goal! +1 for Player${widget.playerNumber}: ${widget.playerName}')));
                },
                shape: CircleBorder(),
                color: Color.fromRGBO(29, 89, 179, 1),
                padding: EdgeInsets.all(0),
                child: Icon(Icons.add),
              ),
            ),
            Positioned(
              left: 0,
              top: 70,
              width: 150,
              child: Center(
                child: Text('${widget.playerName}'),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              width: 50,
              height: 50,
              child: FlatButton(
                onPressed: () {
                  _removeGoalFromPlayer();
                  widget.notifyParent();
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Remove one Goal from Player${widget.playerNumber}: ${widget.playerName}')));
                },
                shape: CircleBorder(),
                color: Color.fromRGBO(179, 29, 59, 1),
                padding: EdgeInsets.all(0),
                child: Icon(Icons.remove),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              width: 50,
              height: 50,
              child: FlatButton(
                onPressed: () {
                  _addOwnGoal();
                  widget.notifyParent();
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Own Goal for Player${widget.playerNumber}: ${widget.playerName}')));
                },
                shape: CircleBorder(),
                color: Colors.black,
                padding: EdgeInsets.all(0),
                child: Text(
                  'ET',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
