import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imccalc/imcCalculatorLogic.dart';

import 'baseCard.dart';
import 'cardModel.dart';
import 'consts.dart';
import 'lowerButton.dart';
import 'resultScreen.dart';
import 'roundedButton.dart';

enum NumSex {
  masc,
  femi,
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NumSex choosenSex;
  int height = 180;
  int weight = 60;
  int age = 18;
  String strimcres = '';
  double numIMC = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CALCULADORA IMC')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BaseCard(
                    onPress: () {
                      setState(() {
                        choosenSex = NumSex.masc;
                      });
                    },
                    color: choosenSex == NumSex.masc ? kMainColor : kMainInactiveColor,
                    cardChild: CardModel(
                      icon: FontAwesomeIcons.mars,
                      text: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: BaseCard(
                    onPress: () {
                      setState(() {
                        choosenSex = NumSex.femi;
                      });
                    },
                    color: choosenSex == NumSex.femi ? kMainColor : kMainInactiveColor,
                    cardChild: CardModel(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMININO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BaseCard(
              color: kMainColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ALTURA',
                    style: kStylePattern,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStylePattern,
                      ),
                      Text(
                        'cm',
                        style: kStylePattern,
                      )
                    ],
                  ),
                  Slider(
                    activeColor: Color(0xFFFF5822),
                    inactiveColor: Color(0xFF8D8E98),
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BaseCard(
                    color: kMainColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PESO',
                          style: kStylePattern,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStylePattern,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundedButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BaseCard(
                    color: kMainColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'IDADE',
                          style: kStylePattern,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStylePattern,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundedButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          lowerBar(
            buttonTitle: 'CALCULAR',
            onPress: () {
              IMCCalc calc = IMCCalc(fheight: height, fweight: weight);
              setState(() {
                numIMC = calc.IMCResult();
              });

              print(weight);
              print(height);
              print(calc.IMCResult());
              print(calc.getResult(numIMC));
              print(calc.getTextResult(numIMC));

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => resultScreen(
                    IMCResult: calc.IMCResult().toStringAsFixed(1),
                    DescResult: calc.getResult(numIMC),
                    textResult: calc.getTextResult(numIMC),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
