import 'dart:math';

class Brain {
  Brain({required this.height, required this.weight});
  final int height;
  final int weight;

  late double bmi;

  String getbmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (bmi >= 25) {
      return 'overweight';
    } else if (bmi < 18) {
      return 'Underweight';
    } else {
      return 'Normal';
    }
  }

  String getdisc() {
    if (bmi >= 25) {
      return ' Exercise more and  consider making some changes to your lifestyle. ';
    } else if (bmi >= 25) {
      return 'Great Your BMI is within a healthy range.';
    } else {
      return ' You might want to focus on increasing your weight in a healthy way.';
    }
  }
}
