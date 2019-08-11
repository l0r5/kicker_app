import 'package:flutter/material.dart';
import 'package:kicker_app/utils/consts_utils.dart';

class ResultCard extends StatelessWidget {
  final title;
  final body;
  final heightSize;

  ResultCard({this.title, this.body, this.heightSize});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RESULT_CARD_BORDER_RADIUS),
        ),
        margin: EdgeInsets.all(5),
        elevation: 5,
        child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: heightSize,
            alignment: Alignment.topLeft,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 10,
                    left: 10,
                    width: (MediaQuery.of(context).size.width / 2) - 30,
                    height: RESULT_CARD_HEIGHT_HEADER,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(RESULT_CARD_COLOR),
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(RESULT_CARD_BORDER_RADIUS),
                                topRight: Radius.circular(
                                    RESULT_CARD_BORDER_RADIUS))),
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5),
                        child: Text(title,
                            style: Theme.of(context).textTheme.body1.copyWith(fontSize: 12.0)))),
                Positioned(
                    top: RESULT_CARD_HEIGHT_HEADER,
                    left: 10,
                    width: (MediaQuery.of(context).size.width / 2) - 30,
                    height: heightSize - RESULT_CARD_HEIGHT_HEADER,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(RESULT_CARD_COLOR),
                          borderRadius: BorderRadius.only(
                              bottomLeft:
                                  Radius.circular(RESULT_CARD_BORDER_RADIUS),
                              bottomRight:
                                  Radius.circular(RESULT_CARD_BORDER_RADIUS))),
                      child: body,
                    ))
              ],
            )));
  }
}
