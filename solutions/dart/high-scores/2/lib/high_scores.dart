class HighScores {
  List<int> scores = [];

  HighScores(List<int> input) {
    scores = input;
  }

  int latest() {
    return scores.last;
  }

  int personalBest() {
    List<int> copy = List.from(scores);
    copy.sort();
    return copy.last;
  }

  List<int> personalTopThree() {
    List<int> copy = List.from(scores);
    copy.sort();
    return [
      for (int i = 1; i <= 3; i++)
        if (copy.length - 1 >= 0) copy[copy.length - i]
    ];
  }
}
