import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'states/Login.dart';
import 'states/User.dart';
import 'states/Community.dart';
import 'states/Match.dart';

GetIt getIt = new GetIt();

void main() {
  getIt.registerSingleton(Login());
  getIt.registerSingleton(User());
  getIt.registerSingleton(Community());
  getIt.registerSingleton(Match());
  runApp(App());
}
