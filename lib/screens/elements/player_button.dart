import 'package:flutter/material.dart';

import '../../states/Match.dart';
import '../../main.dart';

class PlayerButton extends StatefulWidget {
  final playerNumber;
  final availablePlayers;
  final Function() notifyParent;

  const PlayerButton(
      {this.playerNumber, this.availablePlayers, this.notifyParent});

  @override
  _PlayerButtonState createState() {
    return _PlayerButtonState(playerNumber, availablePlayers, notifyParent);
  }
}

class _PlayerButtonState extends State<PlayerButton> {
  final Function() notifyParent;

  final match = getIt.get<Match>();
  final playerNumber;
  List<String> availablePlayers;
  String _dropdownValue;
  List<String> _menuList;

  _PlayerButtonState(
      this.playerNumber, this.availablePlayers, this.notifyParent);

  @override
  Widget build(BuildContext context) {
    if (_dropdownValue == null) {
      _dropdownValue = 'Choose Player';
      _menuList = [_dropdownValue]..addAll(availablePlayers);
    }

    return DropdownButton<String>(
      value: _dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          _dropdownValue = newValue;
          match.setPlayerName(playerNumber, newValue);
          widget.notifyParent();
        });
      },
      items: _menuList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
