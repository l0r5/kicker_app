import 'package:flutter/material.dart';
import '../states/Match.dart';
import '../main.dart';
import 'elements/player_controls.dart';
import 'result_screen.dart';

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() {
    return _MatchScreenState();
  }
}

class _MatchScreenState extends State<MatchScreen> {
  final match = getIt.get<Match>();

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Match'),
        ),
        body: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/soccer-field.png',
              fit: BoxFit.fill,
            ),
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                  child: Text(
                "Team1   ${match.getTeamGoals(1).toString()}  :  ${match.getTeamGoals(2).toString()}   Team2",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
              )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10,15,10,15),
                    child: PlayerControls(
                      playerNumber: 1,
                      playerName: match.getPlayerName(1),
                      notifyParent: refresh,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,15,10,15),
                    child: PlayerControls(
                      playerNumber: 3,
                      playerName: match.getPlayerName(3),
                      notifyParent: refresh,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10,15,10,15),
                    child: PlayerControls(
                      playerNumber: 2,
                      playerName: match.getPlayerName(2),
                      notifyParent: refresh,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,15,10,15),
                    child: PlayerControls(
                      playerNumber: 4,
                      playerName: match.getPlayerName(4),
                      notifyParent: refresh,
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              child: Center(
                child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen()));
                  },
                  label: Text('Finish'),
                    icon: Icon(Icons.send)
                ),
              ),
            ),
          ),
        ]));
  }
}
