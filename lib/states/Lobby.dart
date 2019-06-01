import 'package:rxdart/rxdart.dart';

class Lobby {
  BehaviorSubject _usersOnline = BehaviorSubject.seeded('DummyUser');

  String get usersOnline => _usersOnline.value;

  List<String> get usersList {
    String userString = _usersOnline.value;
    return userString.split(',');
  }

  addUser(String email) {
    List users = _usersOnline.value.split(',');
    if (!users.contains(email)) {
      users.add(email);
      _usersOnline
          .add(users.join(",").replaceAll('[', '').replaceAll(']', '').trim());
      print('Added user: $email, New users list: ${_usersOnline.value}');
    } else {
      print('User $email is already in the list of users: ${_usersOnline.value}');
    }
  }
}
