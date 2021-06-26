class KnightProblem {
  int height;
  int width;
  late List<int> fields;
  List<String> steps = [];
  List<String> alphabet = const [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];
  int moves = 0;
  late List<List<int>> posSteps;

  KnightProblem({
    required this.height,
    required this.width,
  }) : fields = List.filled(height * width, 1) {
    posSteps = List<List<int>>.filled(fields.length, []);
    for (var i = 0; i < posSteps.length; i++) {
      posSteps[i] = getSteps(i);
    }
    solveKnightProblem();
  }

  List<int> getSteps(int index) {
    var line = index % width;
    var row = (index / width).floor();
    var possibilities = <int>[
      checkMove(line + 2, row + 1),
      checkMove(line + 2, row - 1),
      checkMove(line - 2, row + 1),
      checkMove(line - 2, row - 1),
      checkMove(line + 1, row + 2),
      checkMove(line + 1, row - 2),
      checkMove(line - 1, row + 2),
      checkMove(line - 1, row - 2),
    ];
    possibilities.removeWhere((element) => element < 0);
    return possibilities;
  }

  int checkMove(int line, int row) {
    if (line < 0 || line >= width || row < 0 || row >= height) {
      return -1;
    }
    var index = line + row * width;
    return index;
  }

  void solveKnightProblem() {
    try {
      if (height < 3 || width < 3 || (height + width) < 7) {
        throw ArgumentError.value(
            'Both sides must be at least 3, the sum of both at least 7');
      }
      var result = makeStep(0);
      print('possible? $result in $moves');
      if (result) {
        print(steps.join(', '));
      }
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
      print('data: $height, $width');
    }
  }

  bool makeStep(int index) {
    moves += 1;
    if (moves % 100000000 == 0) {
      print(moves);
    }
    try {
      if (fields[index] == 0) {
        return false;
      }
      fields[index] = 0;
      steps.add(fieldName(index));
    } catch (e) {
      return false;
    }
    if (!fields.contains(1)) {
      // if (moves.contains(index)) {
      return true;
      // }
      // fields[index] = 1;
      // return false;
    }
    for (var item in posSteps[index]) {
      if (makeStep(item)) {
        return true;
      }
    }
    fields[index] = 1;
    steps.removeLast();
    return false;
  }

  String fieldName(int index) {
    var first = (index % width);
    var second = ((index / width).floor() + 1).toString();
    return '${fieldLetter(first)}$second';
  }

  String fieldLetter(int fieldNumber) {
    var letterNumber = fieldNumber % 26;
    var letter = alphabet[letterNumber];
    if (fieldNumber > 25) {
      var number = ((fieldNumber - letterNumber) / 26).floor() - 1;
      letter = '${fieldLetter(number)}$letter';
    }
    return letter;
  }
}
