import 'package:rxdart/rxdart.dart';

class User {

  BehaviorSubject _uid = BehaviorSubject.seeded(null);
  BehaviorSubject _username = BehaviorSubject.seeded('not set');
  BehaviorSubject _email = BehaviorSubject.seeded('not set');
  BehaviorSubject _isLoggedIn = BehaviorSubject.seeded(false);

  String get username => _username.value;
  String get email => _email.value;
  String get uid => _uid.value;

  bool get isLoggedIn => _isLoggedIn.value;

  setUid(String uid) {
    _uid.add(uid);
  }

  setUsername(String username) {
    _username.add(username);
  }

  setEmail(String email) {
    _email.add(email);
  }

  setIsLoggedIn(bool value) {
    _isLoggedIn.add(value);
  }

  reset() {
    _username = BehaviorSubject.seeded('not set');
    _email = BehaviorSubject.seeded('not set');
    _isLoggedIn = BehaviorSubject.seeded(false);
  }
}
