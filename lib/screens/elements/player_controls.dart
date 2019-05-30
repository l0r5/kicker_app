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
    return _PlayerControlsState(playerNumber, playerName, notifyParent);
  }
}

class _PlayerControlsState extends State<PlayerControls> {
  final Function() notifyParent;

  final match = getIt.get<Match>();

  final playerNumber;
  final playerName;

  _PlayerControlsState(this.playerNumber, this.playerName, this.notifyParent);

  _addGoalToPlayer() {
    int playerGoals;
    int teamGoals;
    switch (playerNumber) {
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
    switch (playerNumber) {
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

    if (playerNumber == 1 || playerNumber == 2) {
      teamGoals = match.team2Goals;
      teamGoals++;
      match.setTeam2Goals(teamGoals.toString());
    }

    if (playerNumber == 3 || playerNumber == 4) {
      teamGoals = match.team1Goals;
      teamGoals++;
      match.setTeam1Goals(teamGoals.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _addGoalToPlayer();
              widget.notifyParent();
              Scaffold.of(context).showSnackBar(SnackBar(
                  content:
                      Text('Goal! +1 for Player$playerNumber: $playerName')));
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
              _removeGoalFromPlayer();
              widget.notifyParent();
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Remove one Goal from Player$playerNumber: $playerName')));
            },
            child: Text('-'),
          ),
          RaisedButton(
            onPressed: () {
              _addOwnGoal();
              widget.notifyParent();
              Scaffold.of(context).showSnackBar(SnackBar(
                  content:
                      Text('Own Goal for Player$playerNumber: $playerName')));
            },
            child: Text('ET'),
          ),
        ],
      )
    ]);
  }
}
