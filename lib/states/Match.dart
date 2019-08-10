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
    _players.add(
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
    Map matchPlayers = players;
    if (matchPlayers == null) {
      _initPlayers();
    }
    switch (teamNumber) {
      case 1:
        return matchPlayers[1]['playerGoals'] + matchPlayers[2]['playerGoals'];
      case 2:
        return matchPlayers[3]['playerGoals'] + matchPlayers[4]['playerGoals'];
      default:
        return 'Error';
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
    _players.add(matchPlayers[playerNumber]['playerGoals']);
  }

}
