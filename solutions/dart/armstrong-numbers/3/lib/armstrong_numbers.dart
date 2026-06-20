class ArmstrongNumbers {
  bool isArmstrongNumber(String numLiteral) {
    int power = numLiteral.length;
    final BigInt number = BigInt.parse(numLiteral);
    BigInt sum = BigInt.zero;
    BigInt iterNumber = number;
    final BigInt ten = BigInt.from(10);
    while (iterNumber != BigInt.zero) {
      BigInt digit = iterNumber % ten;
      iterNumber = iterNumber ~/ ten;
      sum += digit.pow(power);
    }
    return sum == number;
  }
}
