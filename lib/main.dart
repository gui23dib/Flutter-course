import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Helper helper = Helper();
void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> pointLog = [
    const SizedBox(
      width: 20,
      child: Icon(Icons.check, color: Colors.white),
    )
  ];

  var totalPoints = 0;

  void checkAnswers(bool selectedAnswer) {
    bool rightAnswer = helper.getAnswers();

    setState(
      () {
        if (selectedAnswer == rightAnswer) {
          totalPoints++;
          pointLog.add(
            const Icon(Icons.check, color: Colors.green),
          );
        } else {
          pointLog.add(
            const Icon(Icons.close, color: Colors.red),
          );
        }
        if (pointLog.length == 16) {}
        helper.nextQuestion();
      },
    );
    if (helper.checkExecution() == true) {
      Alert(
        context: context,
        title: "Fim do QUIZ!",
        desc: "Você respondeu todas as perguntas. \n Pontuação: $totalPoints",
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
              setState(
                () {
                  helper.resetExecution();
                  pointLog = [
                    const SizedBox(
                      width: 20,
                      child: Icon(Icons.check, color: Colors.white),
                    )
                  ];
                  totalPoints = 0;
                },
              );
            },
            width: 200,
            color: Colors.grey,
            child: const Text(
              "Tentar novamente",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Verdadeiro',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                checkAnswers(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                checkAnswers(false);
              },
            ),
          ),
        ),
        Center(
          child: Row(
            children: pointLog,
          ),
        )
      ],
    );
  }
}
