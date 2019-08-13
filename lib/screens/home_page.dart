import 'package:flutter/material.dart';
import 'package:kicker_app/utils/consts_utils.dart';

import 'elements/lobby_list_view.dart';


class HomePage extends StatelessWidget {

  final sortedLobbyUsers;
  final userEmail;
  final updateLobby;

  const HomePage(
      {this.sortedLobbyUsers, this.userEmail, this.updateLobby});


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.lightGreen),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(children: <Widget>[
              Text(
                'Kicker App',
                style: Theme
                    .of(context)
                    .textTheme
                    .title
                    .copyWith(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                width: 100,
                height: 100,
                child: Image(image: AssetImage('assets/football.png')),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ROUTE_SINGLE_MATCH);
                  },
                  label: Text('Single Match'),
                  icon: Icon(Icons.videogame_asset),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Color(PRIMARY_COLOR),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                        ),
                      ]),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Lobby',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                )),
                            Container(
                              height:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .height / 3,
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(3)),
                              ),
                              child: LobbyListView(
                                context: context,
                                items: sortedLobbyUsers,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text('Logged in as: $userEmail',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  )),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        width: 100,
                        child: RaisedButton(
                          onPressed: updateLobby,
                          child: Icon(Icons.refresh),
                        ),
                      ),
                    ],
                  )),
            ])));
  }
}