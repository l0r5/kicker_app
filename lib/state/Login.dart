import 'package:flutter/material.dart';

class Login extends InheritedWidget {

  static of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(Login);

  final bool isLoggedIn;

  Login({Key key, @required Widget child, @required this.isLoggedIn})
      : assert(isLoggedIn != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(Login oldWidget) {
    return this.isLoggedIn != oldWidget.isLoggedIn;
  }
}