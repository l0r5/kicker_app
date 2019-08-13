import 'package:rxdart/rxdart.dart';

class Lobby {
  BehaviorSubject _lobbyUsers = BehaviorSubject.seeded([]);

  List get lobbyUsers => _lobbyUsers.value;

  List get lobbyUsersSortedLoggedIn {
    List currentLobbyUsers = lobbyUsers;
    int index = 0;
    List onlineUsers = [];
    List offlineUsers = [];
    for(var user in currentLobbyUsers) {
      if(user['isLoggedIn']) {
        onlineUsers.add(currentLobbyUsers[index]);
      } else {
        offlineUsers.add(currentLobbyUsers[index]);
      }
      index++;
    }
    return onlineUsers + offlineUsers;
  }

  List<String> get getLobbyUserNames {
    List<String> usernames = [];
    lobbyUsers.forEach((user) => usernames.add(user['username']));
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
    int occurrenceIndex;
    currentLobbyUsers.forEach((existingUser) {
      if (existingUser['username'] == user['username']) {
        existingUser['isLoggedIn'] = user['isLoggedIn'];
        occurrences++;
        occurrenceIndex = currentLobbyUsers.indexOf(existingUser);
      }
    });
    if (occurrences == 0) {
      currentLobbyUsers.add(user);
    } else {
      currentLobbyUsers[occurrenceIndex] = user;
    }
    _lobbyUsers.add(currentLobbyUsers);
  }
}
