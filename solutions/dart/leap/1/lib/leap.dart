class Leap {
  bool leapYear(int yearToCheck) {
    bool divisibleBy4 = yearToCheck % 4 == 0;
    bool divisibleBy100 = yearToCheck % 100 == 0;
    bool divisibleBy400 = yearToCheck % 400 == 0;
    return (divisibleBy4 && !divisibleBy100) ||
        (divisibleBy100 && divisibleBy400);
  }
}
