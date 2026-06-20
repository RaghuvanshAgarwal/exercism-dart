class HighScores {
  List<int> scores = [];

  HighScores(List<int> input) {
    scores = input;
  }

  int latest() {
    return scores.last;
  }

  int personalBest() {
    List<int> copy = scores;
    copy.sort();
    return copy.last;
  }

  List<int> personalTopThree() {
    List<int> copy = scores;
    copy.sort();
    return [for (int i = 1; i <= 3; i++) copy[copy.length - i]];
  }
}
