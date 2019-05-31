import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'services/authentication.dart';
import 'states/User.dart';
import 'states/Community.dart';
import 'states/Match.dart';

GetIt getIt = new GetIt();

void main() {
  getIt.registerSingleton(User());
  getIt.registerSingleton(Community());
  getIt.registerSingleton(Match());
  getIt.registerSingleton(Auth());

  runApp(App());
}
