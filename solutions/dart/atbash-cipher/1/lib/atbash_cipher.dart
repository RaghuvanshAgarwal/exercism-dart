class AtbashCipher {
  final String plain = 'abcdefghijklmnopqrstuvwxyz';
  final String cipher = 'zyxwvutsrqponmlkjihgfedcba';
  String encode(String original) {
    String modified = '';
    int count = 0;
    for (int i = 0; i < original.length; i++) {
      if (original[i] == ' ') continue;
      modified += cipher[plain.indexOf(original[i])];
      count++;
      if (count % 5 == 0) modified += ' ';
    }
    return modified;
  }

  String decode(String original) {
    String modified = '';
    for (int i = 0; i < original.length; i++) {
      if (original[i] == ' ') continue;
      modified += plain[cipher.indexOf(original[i])];
    }
    return modified;
  }
}
