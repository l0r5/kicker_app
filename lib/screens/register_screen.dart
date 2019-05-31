import 'package:flutter/material.dart';

import '../forms/register_form.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kicker App Register'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40),
            child: RegisterForm(),
          ),
        )
    );
  }
}