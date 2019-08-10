import 'package:flutter/material.dart';

class LobbyListView extends StatelessWidget {
  final context;
  final items;

  LobbyListView({this.items, this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
        child: ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          dense: true,
          contentPadding: EdgeInsets.all(1),
          leading: Icon(Icons.language),
          title: Text(
          '${items[index]}',
          ),
        );
      },
      itemCount: items.length,
      separatorBuilder: (context, index) {
        return Divider();
      },
    ));
  }
}
