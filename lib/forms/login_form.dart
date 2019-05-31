import 'package:flutter/material.dart';
import 'package:kicker_app/screens/register_screen.dart';
import 'package:kicker_app/states/Community.dart';
import '../main.dart';
import '../states/Login.dart';
import '../states/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final community = getIt.get<Community>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _userName;
  String _password;

  _logIn() {
    Future<FirebaseUser> _handleSignIn() async {
//      final AuthCredential credential = GoogleAuthProvider.getCredential(
//        accessToken: googleAuth.accessToken,
//        idToken: googleAuth.idToken,
//      );
//
//      final FirebaseUser user = await _auth.signInWithCredential(credential);
//      print("signed in " + user.displayName);
//      return user;
//    }

      final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
        email: _userName,
        password: _password,
      );

      login.logIn();
    }
  }

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
            onSaved: (value) {
              _password = value;
            },
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
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Authenticate...')));

                    _formKey.currentState.save();

                    _logIn();

                    user.setEmail(_userName);
                    community.addUser(user.email);

                    Navigator.pushReplacementNamed(context, globals.ROUTE_HOME);
                  }
                },
                child: Text(
                  'Login (isLoggedIn: ${login.isLoggedIn})',
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()));
                },
                child: Text(
                  'Register',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ))
        ]));
  }
}
