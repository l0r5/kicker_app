import 'package:flutter/material.dart';
import 'package:kicker_app/services/authentication_service.dart';
import 'package:kicker_app/services/lobby_service.dart';
import 'package:kicker_app/states/Lobby.dart';
import '../main.dart';
import '../states/User.dart';
import '../utils/globals_utils.dart' as globals;

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
  final BaseLobbyService lobbyService = getIt.get<LobbyService>();

  String _email;
  String _password;
  String _passwordConfirmed;
  String _validationMessage = '';

  void _register() async {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Register...')));
    await auth.signUp(_email, _password).then((userId) {
      print('Signed up: $userId');
      auth.sendEmailVerification();
      _showVerifyEmailSentDialog();
      user.setEmail(_email);
      user.setIsLoggedIn(true);
      _updateLobby();
    });
  }

  _updateLobby() async {
    await lobbyService.addOnlineUser(user.email).then((onlineUsers) {
        lobby.setUsersOnline(onlineUsers);
    });
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
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
              child: MaterialButton(
                elevation: 5.0,
                minWidth: 200.0,
                height: 42.0,
                color: Colors.blue,
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
