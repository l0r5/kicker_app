import 'package:rxdart/rxdart.dart';

class Match {
  BehaviorSubject _players = BehaviorSubject.seeded(
    {
      1: {'playerName': 'not set', 'playerGoals': 0},
      2: {'playerName': 'not set', 'playerGoals': 0},
      3: {'playerName': 'not set', 'playerGoals': 0},
      4: {'playerName': 'not set', 'playerGoals': 0}
    },
  );

  Map get players => _players.value;

  reset() {
    _initPlayers();
  }

  _initPlayers() {
    _players = BehaviorSubject.seeded(
      {
        1: {'playerName': 'not set', 'playerGoals': 0},
        2: {'playerName': 'not set', 'playerGoals': 0},
        3: {'playerName': 'not set', 'playerGoals': 0},
        4: {'playerName': 'not set', 'playerGoals': 0}
      },
    );
  }

  getPlayerNameByNumber(int playerNumber) {
    Map matchPlayers = players;
    if (matchPlayers == null) {
      _initPlayers();
    }
    return matchPlayers[playerNumber]['playerName'];
  }

  setPlayer(int playerNumber, String playerName) {
    Map matchPlayers = players;
    if (matchPlayers == null) {
      _initPlayers();
    } else {
      matchPlayers[playerNumber] = {
        'playerName': '$playerName',
        'playerGoals': 0
      };
      _players.add(matchPlayers);
    }
  }

  getTeamNamesByTeamNumber(int teamNumber) {
    Map matchPlayers = players;
    if (matchPlayers == null) {
      _initPlayers();
    }
    switch (teamNumber) {
      case 1:
        return '${matchPlayers[1]['playerName']},${matchPlayers[2]['playerName']}';
      case 2:
        return '${matchPlayers[3]['playerName']},${matchPlayers[4]['playerName']}';
      default:
        return 'Error';
    }
  }

  getTeamGoalsByTeamNumber(int teamNumber) {
    if (players == null) {
      _initPlayers();
    }
    int player1 = players[1]['playerGoals'];
    int player2 = players[2]['playerGoals'];
    int player3 = players[3]['playerGoals'];
    int player4 = players[4]['playerGoals'];
    switch (teamNumber) {
      case 1:
        return  player1+player2;
      case 2:
        return player3+player4;
      default:
        return 1;
    }
  }

  getPlayerGoalsByPlayerNumber(int playerNumber) {
    Map matchPlayers = players;
    if (matchPlayers == null) {
      _initPlayers();
    }
    return matchPlayers[playerNumber]['playerGoals'];
  }

  setPlayerGoalsByPlayerNumber(int playerNumber, int goals) {
    Map matchPlayers = players;
    if (matchPlayers == null) {
      _initPlayers();
    }
    matchPlayers[playerNumber]['playerGoals'] = goals;
    _players.add(matchPlayers);
  }

}
