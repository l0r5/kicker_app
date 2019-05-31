import 'package:flutter/material.dart';
import 'package:kicker_app/screens/register_screen.dart';
import 'package:kicker_app/services/authentication.dart';
import 'package:kicker_app/states/Community.dart';
import '../main.dart';
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
  final user = getIt.get<User>();
  final community = getIt.get<Community>();
  final BaseAuth auth = getIt.get<Auth>();
  String _validationMessage = '';
  String _email;
  String _password;

  _logIn() async {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Logging in...')));
    try {
      await auth.signIn(_email, _password).then((userId) {
        print('Signed in: $userId');
        user.setEmail(_email);
        community.addUser(user.email);
        Navigator.pushReplacementNamed(context, globals.ROUTE_HOME);
        user.setIsLoggedIn(true);
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
      } else {
        setState(() {
          _validationMessage = '$error';
        });
      }
    }
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
              child: MaterialButton(
                elevation: 5.0,
                minWidth: 200.0,
                height: 42.0,
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _logIn();
                  }
                },
                child: Text(
                  'Login (isLoggedIn: ${user.isLoggedIn})',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: MaterialButton(
                elevation: 5.0,
                minWidth: 200.0,
                height: 42.0,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Text(
                  'Register',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ))
        ]));
  }
}
