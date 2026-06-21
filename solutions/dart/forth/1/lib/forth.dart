class Forth {
  List<int> stack = [];
  Map<String, List<String>> _userDefinedWords = {};
  late final Map<String, Function()> _intArthematics;
  late final Map<String, Function()> _stackManipulators;

  Forth() {
    _intArthematics = {
      '+': () {
        if (stack.length < 2) throw Exception('Stack empty');
        int p1 = stack.removeLast();
        int p0 = stack.removeLast();
        stack.add(p0 + p1);
      },
      '-': () {
        if (stack.length < 2) throw Exception('Stack empty');
        int p1 = stack.removeLast();
        int p0 = stack.removeLast();
        stack.add(p0 - p1);
      },
      '*': () {
        if (stack.length < 2) throw Exception('Stack empty');
        int p1 = stack.removeLast();
        int p0 = stack.removeLast();
        stack.add(p0 * p1);
      },
      '/': () {
        if (stack.length < 2) throw Exception('Stack empty');
        int p1 = stack.removeLast();
        int p0 = stack.removeLast();
        if (p1 == 0) throw Exception('Division by zero');
        stack.add((p0 / p1).floor());
      }
    };

    _stackManipulators = {
      'dup': () {
        if (stack.isEmpty) throw Exception('Stack empty');
        stack.add(stack.last);
      },
      'drop': () {
        if (stack.isEmpty) throw Exception('Stack empty');
        stack.removeLast();
      },
      'swap': () {
        if (stack.length < 2) throw Exception('Stack empty');
        int p1 = stack.removeLast();
        int p0 = stack.removeLast();
        stack.add(p1);
        stack.add(p0);
      },
      'over': () {
        if (stack.length < 2) throw Exception('Stack empty');
        stack.add(stack[stack.length - 2]);
      }
    };
  }

  void evaluate(String input) {
    final tokens =
        input.toLowerCase().split(' ').where((t) => t.isNotEmpty).toList();

    int i = 0;
    while (i < tokens.length) {
      if (tokens[i] == ':') {
        int end = tokens.indexOf(';', i);
        if (end == -1) throw Exception('Invalid definition');

        final defTokens = tokens.sublist(i + 1, end); // [name, ...body]
        if (defTokens.isEmpty) throw Exception('Invalid definition');

        final name = defTokens.first;
        final body = defTokens.sublist(1);

        if (_isNumber(name)) throw Exception('Invalid definition');

        _userDefinedWords[name] = _expandBody(body);
        i = end + 1;
      } else {
        _executeToken(tokens[i]);
        i++;
      }
    }
  }

  // Substitute any currently-known user-defined words in [body]
  // with their already-expanded definitions ("snapshot" semantics).
  List<String> _expandBody(List<String> body) {
    final expanded = <String>[];
    for (final token in body) {
      if (_userDefinedWords.containsKey(token)) {
        expanded.addAll(_userDefinedWords[token]!);
      } else {
        expanded.add(token);
      }
    }
    return expanded;
  }

  void _executeToken(String token) {
    if (_isNumber(token)) {
      stack.add(int.parse(token));
    } else if (_userDefinedWords.containsKey(token)) {
      // user-defined words take priority, so they can override built-ins
      for (final t in _userDefinedWords[token]!) {
        _executeToken(t);
      }
    } else if (_intArthematics.containsKey(token)) {
      _intArthematics[token]!();
    } else if (_stackManipulators.containsKey(token)) {
      _stackManipulators[token]!();
    } else {
      throw Exception('Unknown command');
    }
  }

  bool _isNumber(String s) => int.tryParse(s) != null;
}
