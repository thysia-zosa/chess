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
  late List<int> moves;

  KnightProblem({
    required this.height,
    required this.width,
  }) : fields = List.filled(height * width, 1) {
    moves = [
      2 * height + 1,
      2 * height - 1,
      height + 2,
      height - 2,
      -height + 2,
      -height - 2,
      -2 * height + 1,
      -2 * height - 1,
    ];
    solveKnightProblem();
  }

  void solveKnightProblem() {
    try {
      if (height < 3 || width < 3 || (height + width) < 7) {
        throw ArgumentError.value(
            'Both sides must be at least 3, the sum of both at least 7');
      }
      var result = makeStep(0);
      print('possible? $result');
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
    try {
      if (fields[index] == 0) {
        return false;
      }
      fields[index] = 0;
      steps.add(fieldName(index));
    } catch (e) {
      return false;
    }
    if (fieldSum() == 0 ||
        makeStep(index + moves[0]) ||
        makeStep(index + moves[1]) ||
        makeStep(index + moves[2]) ||
        makeStep(index + moves[3]) ||
        makeStep(index + moves[4]) ||
        makeStep(index + moves[5]) ||
        makeStep(index + moves[6]) ||
        makeStep(index + moves[7])) {
      return true;
    }
    return false;
  }

  int fieldSum() {
    return fields.fold<int>(0, (first, second) => first + second);
  }

  String fieldName(int index) {
    var second = (index % width + 1).toString();
    var first = (index / width).floor();
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
