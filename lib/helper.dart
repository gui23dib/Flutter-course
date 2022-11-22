import 'package:quizzapp/questions.dart';

class Helper {
  int _currentQuestion = 0;

  final List _questionsList = [
    Questions('O metrô é um dos meios de transporte mais seguros do mundo.', true),
    Questions('A culinária brasileira é uma das melhores do mundo.', true),
    Questions('Vacas podem voar, assim como peixes d\'agua utilizam os pés para andar. ', false),
    Questions('O metrô é um dos meios de transporte mais seguros do mundo.', true),
    Questions('A culinária brasileira é uma das melhores do mundo.', true),
    Questions('Vacas podem voar, assim como peixes utilizam os pés para andar.', false),
    Questions('A maioria dos peixes podem viver fora da água.', false),
    Questions('A lâmpada foi inventada por um brasileiro.', false),
    Questions('É possível utilizar a carteira de habilitação de carro para dirigir um avião.', false),
    Questions('O Brasil possui 26 estados e 1 Distrito Federal.', true),
    Questions('Bitcoin é o nome dado a uma das moedas virtuais mais famosas.', true),
    Questions('1 minuto equivale a 60 segundos.', true),
    Questions('1 segundo equivale a 200 milissegundos.', false),
    Questions('O Burj Khalifa, em Dubai, é considerado o maior prédio do mundo.', true),
    Questions('Ler após uma refeição prejudica a visão humana.', false),
    Questions('O cartão de crédito pode ser considerado uma moeda virtual.', false),
  ];

  void nextQuestion() {
    if (_currentQuestion < _questionsList.length - 1) {
      _currentQuestion++;
    }
  }

  String getQuestion() {
    return _questionsList[_currentQuestion].question;
  }

  bool getAnswers() {
    return _questionsList[_currentQuestion].answer;
  }

  checkExecution() {
    if (_currentQuestion >= _questionsList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  resetExecution() {
    _currentQuestion = 0;
  }
}
