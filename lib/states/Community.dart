import 'package:rxdart/rxdart.dart';

class Community {
  BehaviorSubject _users = BehaviorSubject.seeded(
      'Timo, Jonas, Marco, Sven, Reto, Harry, Lars'.trim());

  String get users => _users.value;

  List<String> get usersList {
    String userString = _users.value;
    return userString.split(',');
  }

  addUser(String email) {
    List users = _users.value.split(',');
    if (!users.contains(email)) {
      users.add(email);
      _users
          .add(users.join(",").replaceAll('[', '').replaceAll(']', '').trim());
      print('Added user: $email, New users list: ${_users.value}');
    } else {
      print('User $email is already in the list of users: ${_users.value}');
    }
  }
}
