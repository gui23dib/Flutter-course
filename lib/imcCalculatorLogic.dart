import 'dart:math';

class IMCCalc {
  IMCCalc({this.fheight, this.fweight});

  final int fheight;
  final int fweight;
  double _imc;

  num IMCResult() {
    double _imc = (fweight / pow((fheight / 100), 2));
    print(_imc);
    return _imc;
  }

  String getResult(_imc) {
    if (_imc >= 25) {
      return 'Acima do peso';
    } else if (_imc > 18.5) {
      return 'Dentro do peso recomendado';
    } else {
      return 'Abaixo do peso';
    }
  }

  String getTextResult(_imc) {
    if (_imc >= 25) {
      return 'Você está acima do peso recomendado, tente uma rotina mais saúdavel e ativa.';
    } else if (_imc > 18.5) {
      return 'Excelente!';
    } else {
      return 'Você está abaixo do peso recomendado, tente fazer mais exercicíos e manter uma boa alimentação.';
    }
  }
}
