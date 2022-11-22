import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(
          title: Text('Roll a Die'),
          backgroundColor: Colors.purple[300],
        ),
        body: Dadoos(),
      ),
    ),
  );
}

class Dadoos extends StatefulWidget {
  const Dadoos({Key key}) : super(key: key);

  @override
  _DadoosState createState() => _DadoosState();
}

class _DadoosState extends State<Dadoos> {
  var leftD = 1;
  var rightD = 1;
  var buttonText = '   ';
  var sum = 2;

  void rollBothDies() {
    setState(() {
      buttonText = '';
      rightD = Random().nextInt(6) + 1;
      leftD = Random().nextInt(6) + 1;
      print("Dado esquerdo = $leftD");
      print("Dado direito = $rightD");
      if (rightD == 6 && leftD == 6) {
        print("WOMBO COMBO!!!!!!");
        buttonText = 'WOMBO COMBO!!!!!';
      }
      sum = leftD + rightD;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
        ),
        Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftD = Random().nextInt(6) + 1;
                      print("Dado esquerdo = $leftD");
                      sum = leftD + rightD;
                    });
                  },
                  child: Image.asset('imagens/dado$leftD.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      rightD = Random().nextInt(6) + 1;
                      print("Dado direito = $rightD");
                      sum = leftD + rightD;
                    });
                  },
                  child: Image.asset('imagens/dado$rightD.png'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "$leftD + $rightD = $sum",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            rollBothDies();
          },
          icon: Icon(Icons.adjust_sharp, size: 18),
          label: Text("Roll Die"),
          style: ElevatedButton.styleFrom(primary: Colors.red[700]),
        ),
        SizedBox(
          child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: buttonText.isNotEmpty
                  ? Text(
                      '$buttonText',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    )
                  : null),
        ),
      ],
    );
  }
}
