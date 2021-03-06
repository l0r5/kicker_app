import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kicker_app/screens/register_screen.dart';
import 'package:kicker_app/services/authentication_service.dart';
import 'package:kicker_app/states/Lobby.dart';
import '../main.dart';
import '../states/User.dart';
import '../utils/consts_utils.dart' as globals;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final user = getIt.get<User>();
  final lobby = getIt.get<Lobby>();
  final BaseAuthenticationService authenticationService =
      getIt.get<AuthenticationService>();
  String _validationMessage = '';
  String _email;
  String _password;

  _logIn() async {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Logging in...')));
    try {
      await authenticationService
          .signIn(_email, _password)
          .then((userId) async {
        print('Authenticated: $userId');
        _updateUserData(userId);
        Navigator.pushReplacementNamed(context, globals.ROUTE_HOME);
      });
    } on Exception catch (error) {
      if (error.toString().contains('ERROR_INVALID_EMAIL')) {
        setState(() {
          _validationMessage = 'Invalid Email';
        });
      } else if (error.toString().contains('ERROR_WRONG_PASSWORD')) {
        setState(() {
          _validationMessage = 'Wrong Password';
        });
      } else if (error.toString().contains('ERROR_USER_NOT_FOUND')) {
        setState(() {
          _validationMessage =
              'There is no user record corresponding to this identifer. Please register first';
        });
      } else {
        setState(() {
          _validationMessage = '$error';
        });
      }
    }
  }

  _updateUserData(String userId) {
    user.setUid(userId);
    user.setEmail(_email);
    user.setIsLoggedIn(true);
    Firestore.instance
        .collection('users')
        .document(userId)
        .updateData({'isLoggedIn': true});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: "Email"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
            onSaved: (value) {
              _email = value;
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
            onSaved: (value) {
              _password = value;
            },
          ),
          Text(
            _validationMessage,
            style: TextStyle(color: Colors.red),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _logIn();
                  }
                },
                child: Text('Login'),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Text('Register'),
              ))
        ]));
  }
}
