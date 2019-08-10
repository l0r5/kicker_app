import 'package:flutter/material.dart';

import '../../states/Match.dart';
import '../../main.dart';

class ChoosePlayerButton extends StatefulWidget {
  final playerNumber;
  final availablePlayers;
  final Function() notifyParent;

  const ChoosePlayerButton(
      {this.playerNumber, this.availablePlayers, this.notifyParent});

  @override
  _ChoosePlayerButtonState createState() {
    return _ChoosePlayerButtonState();
  }
}

class _ChoosePlayerButtonState extends State<ChoosePlayerButton> {
  final match = getIt.get<Match>();
  String _dropdownValue;
  List<String> _menuList;

  @override
  Widget build(BuildContext context) {
    if (_dropdownValue == null) {
      _dropdownValue = 'Choose Player';
      _menuList = [_dropdownValue]..addAll(widget.availablePlayers);
    }

    return Container(
        width: 160,
        height: 160,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Stack(children: <Widget>[
          Positioned(
            left: 10,
            top: 25,
            child: Text(
              'Player ${widget.playerNumber}',
            ),
          ),
          Positioned(
              left: 10,
              top: 50,
              child: DropdownButton<String>(
                value: _dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                    match.setPlayerName(widget.playerNumber, newValue);
                    widget.notifyParent();
                  });
                },
                items: _menuList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ))
        ]));
  }
}
