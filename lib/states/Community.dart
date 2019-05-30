import 'package:rxdart/rxdart.dart';

class Community {
  BehaviorSubject _users = BehaviorSubject.seeded(
      'Timo, Jonas, Marco, Sven, Reto, Harry, Lars'.trim());

  String get users => _users.value;

  List<String> get usersList {
    String userString = _users.value;
    return userString.split(',');
  }

  addUser(String userName) {
    List users = _users.value.split(',');
    if (!users.contains(userName)) {
      users.add(userName);
      _users
          .add(users.join(",").replaceAll('[', '').replaceAll(']', '').trim());
      print('Added user: $userName, New users list: ${_users.value}');
    } else {
      print('User $userName is already in the list of users: ${_users.value}');
    }
  }
}
