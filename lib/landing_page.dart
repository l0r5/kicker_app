import 'package:flutter/material.dart';

import 'package:kicker_app/forms/login_form.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: LoginForm(),
    );
  }

}