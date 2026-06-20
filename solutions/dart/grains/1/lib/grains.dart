import 'dart:math';

BigInt square(final int n) {
  return BigInt.from(pow(2, n - 1));
}

BigInt total() {
  BigInt sum = BigInt.zero;
  for (int i = 1; i <= 64; i++) {
    sum += square(i);
  }
  return sum;
}
