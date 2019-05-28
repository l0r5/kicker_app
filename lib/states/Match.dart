import 'package:rxdart/rxdart.dart';

class Match {
  BehaviorSubject _playerName1 = BehaviorSubject.seeded('not set');
  BehaviorSubject _playerName2 = BehaviorSubject.seeded('not set');
  BehaviorSubject _playerName3 = BehaviorSubject.seeded('not set');
  BehaviorSubject _playerName4 = BehaviorSubject.seeded('not set');

  Observable get stream$ => Observable.combineLatest5(
      new Observable.just(playerName1),
      new Observable.just(playerName2),
      new Observable.just(playerName3),
      new Observable.just(playerName4),
      new Observable.fromIterable([playerName1, playerName2, playerName3, playerName4]),
      (a, b, c, d, e) => {"playerName1": a, "playerName2": b, "playerName3": c, "playerName4": d});

  String get playerName1 => _playerName1.value;

  String get playerName2 => _playerName2.value;

  String get playerName3 => _playerName3.value;

  String get playerName4 => _playerName4.value;

  getPlayerName(int playerNumber, playerName) {

  }

  setPlayerName(int playerNumber, playerName) {
    switch (playerNumber) {
      case 1:
        setPlayerName1(playerName);
        break;
      case 2:
        setPlayerName2(playerName);
        break;
      case 3:
        setPlayerName3(playerName);
        break;
      case 4:
        setPlayerName4(playerName);
        break;
    }
  }

  setPlayerName1(String playerName) {
    _playerName1.add(playerName);
  }

  setPlayerName2(String playerName) {
    _playerName2.add(playerName);
  }

  setPlayerName3(String playerName) {
    _playerName3.add(playerName);
  }

  setPlayerName4(String playerName) {
    _playerName4.add(playerName);
  }
}
