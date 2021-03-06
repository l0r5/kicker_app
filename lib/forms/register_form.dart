import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kicker_app/services/authentication_service.dart';
import 'package:kicker_app/states/Lobby.dart';
import '../main.dart';
import '../states/User.dart';
import '../utils/consts_utils.dart' as globals;

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final user = getIt.get<User>();
  final lobby = getIt.get<Lobby>();
  final BaseAuthenticationService auth = getIt.get<AuthenticationService>();

  String _username;
  String _email;
  String _password;
  String _passwordConfirmed;
  String _validationMessage = '';

  _register() async {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Register...')));
    try {
      await auth.signUp(_email, _password).then((userId) {
        print('Authenticated: $userId');
        auth.sendEmailVerification();
        _showVerifyEmailSentDialog();
        _saveUser(userId);
      });
    } on Exception catch (e) {
      if (e.toString().contains('ERROR_INVALID_EMAIL')) {
        _validationMessage =
            'Please enter a valid email format, e.g.: xyz@zxy.com';
      } else if (e.toString().contains('ERROR_EMAIL_ALREADY_IN_USE')) {
        _validationMessage =
            'The email address is already in use by another account';
      } else {
        _validationMessage = e.toString();
      }
      setState(() {});
    }
  }

  _saveUser(String userId) {
    user.setUsername(_username);
    user.setEmail(_email);
    user.setIsLoggedIn(true);
    Firestore.instance.collection('users').document(userId).setData({
      'uid': userId,
      'email': _email,
      'username': _username,
      'isLoggedIn': true,
    });
  }

  _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, globals.ROUTE_HOME);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: 'Username'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              } else {
                if (value.length > 16) {
                  return 'The maximum character length is 16';
                }
              }
            },
            onSaved: (value) {
              _username = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'E-Mail'),
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
            decoration: InputDecoration(hintText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
            onSaved: (value) {
              setState(() {
                _password = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
            onSaved: (value) {
              setState(() {
                _passwordConfirmed = value;
              });
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
                    if (_password == _passwordConfirmed) {
                      _register();
                    } else {
                      setState(() {
                        _validationMessage = 'Please enter matching passwords.';
                      });
                    }
                  }
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ))
        ]));
  }
}
