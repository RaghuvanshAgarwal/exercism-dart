class InvalidNucleotideException implements Exception {
  final String message;

  InvalidNucleotideException([this.message = 'Invalid nucleotide']);

  @override
  String toString() => 'InvalidNucleotideException: $message';
}

class NucleotideCount {
  final List<String> validNucleotides = ['A', 'C', 'G', 'T'];
  Map<String, int> count(String strand) {
    Map<String, int> strandCounts = {'A': 0, 'C': 0, 'G': 0, 'T': 0};
    for (int i = 0; i < strand.length; i++) {
      if (!validNucleotides.contains(strand[i])) {
        throw InvalidNucleotideException();
      }
      strandCounts[strand[i]] = strandCounts[strand[i]]! + 1;
    }
    return strandCounts;
  }
}
