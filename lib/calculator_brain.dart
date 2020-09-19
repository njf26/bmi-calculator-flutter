import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI() {
    _bmi = (weight / pow(height, 2)) * 703;
    return _bmi
        .toStringAsFixed(1); //makes it a string with only one decimal place
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getAdvice() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight for your height. FAAT.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Don\'t mess it up.';
    } else {
      return 'You have a lower than normal body weight. Go eat a donut.';
    }
  }
}
