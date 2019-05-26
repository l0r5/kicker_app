import 'package:rxdart/rxdart.dart';

class Login {
  BehaviorSubject _isLoggedIn = BehaviorSubject.seeded(false);

  Observable get stream$ => _isLoggedIn.stream;

  bool get isLoggedIn => _isLoggedIn.value;

  logIn() {
    _isLoggedIn.add(true);
  }

  logOut() {
    _isLoggedIn.add(false);
  }
}

Login loginService = Login();
