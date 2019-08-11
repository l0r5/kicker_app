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
  BehaviorSubject _teamsGoals = BehaviorSubject.seeded(
    {
      1: 0,
      2: 0,
    },
  );

  Map get players => _players.value;
  Map get teamsGoals => _teamsGoals.value;

  reset() {
    _init();
  }

  _init() {
    _players = BehaviorSubject.seeded(
      {
        1: {'playerName': 'not set', 'playerGoals': 0},
        2: {'playerName': 'not set', 'playerGoals': 0},
        3: {'playerName': 'not set', 'playerGoals': 0},
        4: {'playerName': 'not set', 'playerGoals': 0}
      },
    );
    _teamsGoals = BehaviorSubject.seeded(
      {
        1: 0,
        2: 0,
      },
    );
  }

  getPlayerName(int playerNumber) {
    if (players == null) {
      _init();
    }
    return players[playerNumber]['playerName'];
  }

  setPlayer(int playerNumber, String playerName) {
    Map matchPlayers = players;
    if (matchPlayers == null) {
      _init();
    } else {
      matchPlayers[playerNumber] = {
        'playerName': '$playerName',
        'playerGoals': 0
      };
      _players.add(matchPlayers);
    }
  }

  getPlayerNames(int teamNumber) {
    if (players == null) {
      _init();
    }
    switch (teamNumber) {
      case 1:
        return '${players[1]['playerName']},${players[2]['playerName']}';
      case 2:
        return '${players[3]['playerName']},${players[4]['playerName']}';
    }
  }

  getTeamNumber(int playerNumber) {
    return (playerNumber == 1 || playerNumber == 2) ? 1 : 2;
  }

  getTeamGoals(int teamNumber) {
    return teamsGoals[teamNumber];
  }

  setTeamGoals(int teamNumber, int goals) {
    if (teamsGoals == null) {
      _init();
    }
    Map matchTeamGoals = teamsGoals;
    matchTeamGoals[teamNumber] = goals;
    _teamsGoals.add(matchTeamGoals);
  }

  getPlayerGoals(int playerNumber) {
    if (players == null) {
      _init();
    }
    return players[playerNumber]['playerGoals'];
  }

  setPlayerGoals(int playerNumber, int goals) {
    Map matchPlayers = players;
    if (matchPlayers == null) {
      _init();
    }
    matchPlayers[playerNumber]['playerGoals'] = goals;
    _players.add(matchPlayers);
  }
}
