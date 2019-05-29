import 'package:flutter/material.dart';
import '../main.dart';
import '../states/Login.dart';
import '../states/User.dart';
import '../utils/globals.dart' as globals;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final login = getIt.get<Login>();
  final user = getIt.get<User>();
  String _userName;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: "Username"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
            onSaved: (value) {
              _userName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some password';
              }
            },
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Authenticate...')));

                    _formKey.currentState.save();

                    login.logIn();
                    user.setUsername(_userName);

                    Navigator.pushReplacementNamed(context, globals.ROUTE_HOME);
                  }
                },
                child: Text('Login (isLoggedIn: ${login.isLoggedIn})'),
              ))
        ]));
  }
}
