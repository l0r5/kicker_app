import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'states/Login.dart';

GetIt getIt = new GetIt();

void main() {
  getIt.registerSingleton<Login>(Login());
  runApp(App());
}
