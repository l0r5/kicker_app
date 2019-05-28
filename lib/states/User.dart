import 'package:rxdart/rxdart.dart';

class User {
  BehaviorSubject _userName = BehaviorSubject.seeded('not set');

  Observable get stream$ => _userName.stream;

  String get userName => _userName.value;

  setUsername(String userName){
    _userName.add(userName);
  }
}