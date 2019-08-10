import 'package:flutter/material.dart';

import '../forms/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kicker App Login'),
        ),
        body: Container(
            decoration: BoxDecoration(color: Colors.lightGreen),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40),
                child: LoginForm(),
              ),
            )));
  }
}
