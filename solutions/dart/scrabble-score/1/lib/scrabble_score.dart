int score(String word) {
  word = word.toLowerCase();
  int score = 0;
  Map<String, int> scoreSlab = {
    'aeioulnrst': 1,
    'dg': 2,
    'bcmp': 3,
    'fhvwy': 4,
    'k': 5,
    'jx': 8,
    'qz': 10
  };
  for (int i = 0; i < word.length; i++) {
    for (final entry in scoreSlab.entries) {
      if (entry.key.contains(word[i])) {
        score += entry.value;
      }
    }
  }
  return score;
}
