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

  _addGoalToPlayer() {
    int playerGoals;
    int teamGoals;
    switch (widget.playerNumber) {
      case 1:
        playerGoals = match.player1Goals;
        teamGoals = match.team1Goals;
        playerGoals++;
        teamGoals++;
        match.setPlayer1Goals(playerGoals.toString());
        match.setTeam1Goals(teamGoals.toString());
        break;
      case 2:
        playerGoals = match.player2Goals;
        teamGoals = match.team1Goals;
        playerGoals++;
        teamGoals++;
        match.setPlayer2Goals(playerGoals.toString());
        match.setTeam1Goals(teamGoals.toString());
        break;
      case 3:
        playerGoals = match.player3Goals;
        teamGoals = match.team2Goals;
        playerGoals++;
        teamGoals++;
        match.setPlayer3Goals(playerGoals.toString());
        match.setTeam2Goals(teamGoals.toString());
        break;
      case 4:
        playerGoals = match.player4Goals;
        teamGoals = match.team2Goals;
        playerGoals++;
        teamGoals++;
        match.setPlayer4Goals(playerGoals.toString());
        match.setTeam2Goals(teamGoals.toString());
        break;
    }
  }

  _removeGoalFromPlayer() {
    int playerGoals;
    int teamGoals;
    switch (widget.playerNumber) {
      case 1:
        playerGoals = match.player1Goals;
        teamGoals = match.team1Goals;
        if (playerGoals > 0) {
          playerGoals--;
        }
        if (teamGoals > 0) {
          teamGoals--;
        }
        match.setPlayer1Goals(playerGoals.toString());
        match.setTeam1Goals(teamGoals.toString());
        break;
      case 2:
        playerGoals = match.player2Goals;
        teamGoals = match.team1Goals;
        if (playerGoals > 0) {
          playerGoals--;
        }
        if (teamGoals > 0) {
          teamGoals--;
        }
        match.setPlayer2Goals(playerGoals.toString());
        match.setTeam1Goals(teamGoals.toString());
        break;
      case 3:
        playerGoals = match.player3Goals;
        teamGoals = match.team2Goals;
        if (playerGoals > 0) {
          playerGoals--;
        }
        if (teamGoals > 0) {
          teamGoals--;
        }
        match.setPlayer3Goals(playerGoals.toString());
        match.setTeam2Goals(teamGoals.toString());
        break;
      case 4:
        playerGoals = match.player4Goals;
        teamGoals = match.team2Goals;
        if (playerGoals > 0) {
          playerGoals--;
        }
        if (teamGoals > 0) {
          teamGoals--;
        }
        match.setPlayer4Goals(playerGoals.toString());
        match.setTeam2Goals(teamGoals.toString());
        break;
    }
  }

  _addOwnGoal() {
    int teamGoals;

    if (widget.playerNumber == 1 || widget.playerNumber == 2) {
      teamGoals = match.team2Goals;
      teamGoals++;
      match.setTeam2Goals(teamGoals.toString());
    }

    if (widget.playerNumber == 3 || widget.playerNumber == 4) {
      teamGoals = match.team1Goals;
      teamGoals++;
      match.setTeam1Goals(teamGoals.toString());
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
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
