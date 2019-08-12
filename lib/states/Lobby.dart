import 'package:rxdart/rxdart.dart';

class Lobby {
  BehaviorSubject _usersOnline = BehaviorSubject.seeded([]);

  List<String> get usersOnline => _usersOnline.value;

  reset() {
    _usersOnline = BehaviorSubject.seeded([]);
  }

  setUsersOnline(List<String> usersOnline) {
        _usersOnline.add(usersOnline);
  }
}
