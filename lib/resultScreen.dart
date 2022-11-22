import 'package:flutter/material.dart';
import 'package:imccalc/baseCard.dart';
import 'package:imccalc/consts.dart';
import 'package:imccalc/lowerButton.dart';

class resultScreen extends StatelessWidget {
  resultScreen({@required this.IMCResult, @required this.DescResult, @required this.textResult});

  final String IMCResult;
  final String DescResult;
  final String textResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('CALCULADORA IMC')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Resultado',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: BaseCard(
                color: kMainColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DescResult.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      IMCResult,
                      style: kIMCTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textResult,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            lowerBar(
              onPress: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RECALCULAR',
            ),
          ],
        ));
  }
}
