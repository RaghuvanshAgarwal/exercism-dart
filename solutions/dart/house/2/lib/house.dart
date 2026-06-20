class House {
  final List<List<String>> _parts = [
    ['house that Jack built.', ''],
    ['malt', 'that lay in the house that Jack built.'],
    ['rat', 'that ate the malt'],
    ['cat', 'that killed the rat'],
    ['dog', 'that worried the cat'],
    ['cow with the crumpled horn', 'that tossed the dog'],
    ['maiden all forlorn', 'that milked the cow with the crumpled horn'],
    ['man all tattered and torn', 'that kissed the maiden all forlorn'],
    [
      'priest all shaven and shorn',
      'that married the man all tattered and torn'
    ],
    [
      'rooster that crowed in the morn',
      'that woke the priest all shaven and shorn'
    ],
    ['farmer sowing his corn', 'that kept the rooster that crowed in the morn'],
    [
      'horse and the hound and the horn',
      'that belonged to the farmer sowing his corn'
    ]
  ];

  String recite(int startVerse, int endVerse) {
    return List.generate(
        endVerse - startVerse + 1, (i) => _verse(startVerse + i)).join('\n');
  }

  String _verse(int index) {
    List<String> lines = ['This is the ${_parts[index - 1][0]}'];

    for (int i = index - 1; i > 0; i--) {
      lines.add(_parts[i][1]);
    }

    return lines.join(' ');
  }
}
