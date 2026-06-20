class Proverb {
  String recite(List<String> proverbs) {
    // Edge case empty list;
    if (proverbs.length == 0) return '';

    // Edge Case only one proverb
    if (proverbs.length == 1) {
      return 'And all for the want of a ${proverbs[0]}.';
    }

    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < proverbs.length - 1; i++) {
      buffer.writeln(
          'For want of a ${proverbs[i]} the ${proverbs[i + 1]} was lost.');
    }
    buffer.write('And all for the want of a ${proverbs[0]}.');
    return buffer.toString();
  }
}
