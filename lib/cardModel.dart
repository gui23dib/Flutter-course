import 'package:flutter/material.dart';
import 'consts.dart';

class CardModel extends StatelessWidget {
  CardModel({@required this.icon, @required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 95.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kStylePattern,
        ),
      ],
    );
  }
}
