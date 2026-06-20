class AtbashCipher {
  final String plain = 'abcdefghijklmnopqrstuvwxyz';
  final String cipher = 'zyxwvutsrqponmlkjihgfedcba';
  String encode(String original) {
    original = original.toLowerCase();
    String modified = '';
    int count = 0;
    for (int i = 0; i < original.length; i++) {
      if (original[i] == ' ') continue;
      if (_isLetter(original[i])) {
        modified += cipher[plain.indexOf(original[i])];
      } else {
        modified += original[i];
      }
      count++;
      if (count % 5 == 0) modified += ' ';
    }
    return modified;
  }

  String decode(String original) {
    original = original.toLowerCase();
    String modified = '';
    for (int i = 0; i < original.length; i++) {
      if (original[i] == ' ') continue;
      if (_isDigit(original[i])) {
        modified += original[i];
      } else if (_isLetter(original[i])) {
        modified += plain[cipher.indexOf(original[i])];
      }
    }
    return modified;
  }

  bool _isLetter(String c) => c.codeUnitAt(0) >= 97 && c.codeUnitAt(0) <= 122;
  bool _isDigit(String c) => c.codeUnitAt(0) >= 48 && c.codeUnitAt(0) <= 57;
}
