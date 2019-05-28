import 'package:flutter/material.dart';
import 'package:kicker_app/states/User.dart';

import '../main.dart';
import 'elements/player_button.dart';
import '../states/Match.dart';

class SingleMatchScreen extends StatefulWidget {
  @override
  _SingleMatchScreenState createState() {
    return _SingleMatchScreenState();
  }
}

class _SingleMatchScreenState extends State<SingleMatchScreen> {
  final user = getIt.get<User>();
  final match = getIt.get<Match>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Single Match'),
        ),
        body: Builder(
            builder: (context) => Container(
                decoration: BoxDecoration(color: Colors.lightGreen),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[Text('Username: ${user.userName}')]),
                    Row(
                      children: <Widget>[
                        PlayerButton(playerNumber: 1, playerName: "P1"),
                        PlayerButton(playerNumber: 3, playerName: "P3")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        PlayerButton(playerNumber: 2, playerName: "P2"),
                        PlayerButton(playerNumber: 4, playerName: "P4"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('START')));
                          },
                          child: Text('START'),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
