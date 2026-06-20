class EggCounter {
  int count(int decimalNumber) {
    int eggsPickUpCount = 0;
    while (decimalNumber != 0) {
      eggsPickUpCount += decimalNumber % 2;
      decimalNumber = (decimalNumber / 2).floor();
    }
    return eggsPickUpCount;
  }
}
