import 'package:rxdart/rxdart.dart';

class Match {
  BehaviorSubject _player1Name = BehaviorSubject.seeded('not set');
  BehaviorSubject _player2Name = BehaviorSubject.seeded('not set');
  BehaviorSubject _player3Name = BehaviorSubject.seeded('not set');
  BehaviorSubject _player4Name = BehaviorSubject.seeded('not set');
  BehaviorSubject _team1Names = BehaviorSubject.seeded('not set');
  BehaviorSubject _team2Names = BehaviorSubject.seeded('not set');
  BehaviorSubject _player1Goals = BehaviorSubject.seeded('0');
  BehaviorSubject _player2Goals = BehaviorSubject.seeded('0');
  BehaviorSubject _player3Goals = BehaviorSubject.seeded('0');
  BehaviorSubject _player4Goals = BehaviorSubject.seeded('0');
  BehaviorSubject _team1Goals = BehaviorSubject.seeded('0');
  BehaviorSubject _team2Goals = BehaviorSubject.seeded('0');


  String get player1Name => _player1Name.value;

  String get player2Name => _player2Name.value;

  String get player3Name => _player3Name.value;

  String get player4Name => _player4Name.value;

  String get team1Names => _team1Names.value;

  String get team2Names => _team2Names.value;

  int get player1Goals => int.parse(_player1Goals.value);

  int get player2Goals => int.parse(_player2Goals.value);

  int get player3Goals => int.parse(_player3Goals.value);

  int get player4Goals => int.parse(_player4Goals.value);

  int get team1Goals => int.parse(_team1Goals.value);

  int get team2Goals => int.parse(_team2Goals.value);


  setTeams() {
    _team1Names.value = '$player1Name,$player2Name';
    _team2Names.value = '$player3Name,$player4Name';
  }

  reset() {
    _player1Name = BehaviorSubject.seeded('not set');
    _player2Name = BehaviorSubject.seeded('not set');
    _player3Name = BehaviorSubject.seeded('not set');
    _player4Name = BehaviorSubject.seeded('not set');
    _team1Names = BehaviorSubject.seeded('not set');
    _team2Names = BehaviorSubject.seeded('not set');
    _player1Goals = BehaviorSubject.seeded('0');
    _player2Goals = BehaviorSubject.seeded('0');
    _player3Goals = BehaviorSubject.seeded('0');
    _player4Goals = BehaviorSubject.seeded('0');
    _team1Goals = BehaviorSubject.seeded('0');
    _team2Goals = BehaviorSubject.seeded('0');
  }

  getPlayerNameByNumber(int playerNumber) {
    switch (playerNumber) {
      case 1:
        return player1Name;
      case 2:
        return player2Name;
      case 3:
        return player3Name;
      case 4:
        return player4Name;
    }
  }

  setPlayerName(int playerNumber, String playerName) {
    switch (playerNumber) {
      case 1:
        setPlayer1Name(playerName);
        break;
      case 2:
        setPlayer2Name(playerName);
        break;
      case 3:
        setPlayer3Name(playerName);
        break;
      case 4:
        setPlayer4Name(playerName);
        break;
    }
  }

  setPlayer1Name(String playerName) {
    _player1Name.add(playerName);
  }

  setPlayer2Name(String playerName) {
    _player2Name.add(playerName);
  }

  setPlayer3Name(String playerName) {
    _player3Name.add(playerName);
  }

  setPlayer4Name(String playerName) {
    _player4Name.add(playerName);
  }

  setPlayer1Goals(String value) {
    _player1Goals.add(value);
  }

  setPlayer2Goals(String value) {
    _player2Goals.add(value);
  }

  setPlayer3Goals(String value) {
    _player3Goals.add(value);
  }

  setPlayer4Goals(String value) {
    _player4Goals.add(value);
  }

  setTeam1Goals(String value) {
    _team1Goals.add(value);
  }

  setTeam2Goals(String value) {
    _team2Goals.add(value);
  }
}
