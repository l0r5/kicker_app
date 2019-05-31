import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kicker_app/services/community_service.dart';
import 'app.dart';
import 'services/authentication_service.dart';
import 'states/User.dart';
import 'states/Community.dart';
import 'states/Match.dart';

GetIt getIt = new GetIt();

void main() {
  getIt.registerSingleton(User());
  getIt.registerSingleton(Community());
  getIt.registerSingleton(Match());
  getIt.registerSingleton(AuthenticationService());
  getIt.registerSingleton(CommunityService());
  runApp(App());
}
