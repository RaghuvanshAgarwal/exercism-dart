import 'dart:math';

class DifferenceOfSquares {
  int squareOfSum(int n) {
    return pow((n * (n + 1)) / 2, 2).floor();
  }

  int sumOfSquares(int n) {
    int sum = ((n * (n + 1) * (2 * n + 1)) / 6).floor();
    return sum;
  }

  int differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquares(n);
  }
}
