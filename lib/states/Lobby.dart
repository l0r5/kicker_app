import 'package:rxdart/rxdart.dart';

class Lobby {
  BehaviorSubject _lobbyUsers = BehaviorSubject.seeded([]);

  List get lobbyUsers => _lobbyUsers.value;
  List<String> get getLobbyUserNames {
    List<String> usernames = [];
    lobbyUsers.forEach((user) =>
      usernames.add(user['username'])
    );
    return usernames;
  }

  reset() {
    _lobbyUsers = BehaviorSubject.seeded([]);
  }

  addUser(Map<String, Object> user) {
    List currentLobbyUsers = lobbyUsers;
    if (lobbyUsers == null || lobbyUsers.length == 0) {
      reset();
      currentLobbyUsers = [user];
    }
    int occurrences = 0;
    currentLobbyUsers.forEach((existingUser) {
      if (existingUser['username'] == user['username']) {
        occurrences++;
      }
    });
    if (occurrences == 0) {
      currentLobbyUsers.add(user);
    }
    _lobbyUsers.add(currentLobbyUsers);
  }
}
