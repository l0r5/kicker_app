import 'package:rxdart/rxdart.dart';

class User {
  BehaviorSubject _userName = BehaviorSubject.seeded('not set');

  String get userName => _userName.value;

  setUsername(String userName){
    _userName.add(userName);
  }
}