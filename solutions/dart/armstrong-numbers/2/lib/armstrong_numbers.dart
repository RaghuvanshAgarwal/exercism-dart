import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String numLiteral) {
    int power = numLiteral.length;
    int number = int.parse(numLiteral);
    int sum = 0;
    int iterNumber = number;
    while (iterNumber != 0) {
      int mod = iterNumber % 10;
      iterNumber = (iterNumber / 10).floor();
      sum += pow(mod, power).floor();
    }
    return sum == number;
  }
}
