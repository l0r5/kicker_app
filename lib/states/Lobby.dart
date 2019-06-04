import 'package:rxdart/rxdart.dart';

class Lobby {
  BehaviorSubject _usersOnline = BehaviorSubject.seeded(null);

  String get usersOnline => _usersOnline.value;

  List<String> get usersOnlineList {
    if (usersOnline == null) {
      return [];
    }
    String userString = _usersOnline.value;
    if (userString.contains(',')) {
      return userString.split(',');
    } else {
      return [userString];
    }
  }

  setUsersOnline(List<String> usersOnline) {
    try {
      String resultString = '';
      usersOnline.forEach((user) => resultString += '$user,');
      resultString = resultString.substring(0, resultString.length - 1);
      if (_usersOnline.value == null) {
        _usersOnline = BehaviorSubject.seeded(resultString);
      } else {
        usersOnline.add(resultString);
      }
    } on Exception catch (error) {
      print(error);
    }

  }

  reset() {
    _usersOnline = BehaviorSubject.seeded(null);
  }
}
