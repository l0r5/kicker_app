import 'package:rxdart/rxdart.dart';

class User {
  BehaviorSubject _email = BehaviorSubject.seeded('not set');

  String get email => _email.value;

  setEmail(String userName){
    _email.add(userName);
  }
}