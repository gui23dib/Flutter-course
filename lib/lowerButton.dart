import 'package:flutter/material.dart';

import 'consts.dart';

class lowerBar extends StatelessWidget {
  lowerBar({@required this.onPress, @required this.buttonTitle});

  final Function onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLowerBarStyle,
          ),
        ),
        color: kSecondaryColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 8.0),
        width: double.infinity,
        height: kBarHeight,
      ),
    );
  }
}
