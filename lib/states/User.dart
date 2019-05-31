import 'package:rxdart/rxdart.dart';

class User {
  BehaviorSubject _email = BehaviorSubject.seeded('not set');
  BehaviorSubject _isLoggedIn = BehaviorSubject.seeded(false);

  String get email => _email.value;

  bool get isLoggedIn => _isLoggedIn.value;

  setEmail(String userName) {
    _email.add(userName);
  }

  setIsLoggedIn(bool value) {
    _isLoggedIn.add(value);
  }
}
