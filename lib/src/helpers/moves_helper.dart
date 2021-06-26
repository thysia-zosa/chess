import 'dart:convert';

var width = 8;
var height = 8;
void main(List<String> args) {
  if (args.isEmpty || !getSteps.containsKey(args[0])) {
    print('[]');
    return;
  }
  var posSteps = List<List<int>>.filled(height * width, []);
  for (var i = 0; i < posSteps.length; i++) {
    posSteps[i] = getSteps[args[0]]!(i);
  }
  var jsonList = json.encode(posSteps);
  print(jsonList);
}

Map<String, Function> get getSteps => {
      'white-pawn': getWhitePawnSteps,
      'black-pawn': getBlackPawnSteps,
      'rook': getRookSteps,
      'knight': getKnightSteps,
      'white-bishop': getWhiteBishopSteps,
      'black-bishop': getBlackBishopSteps,
      'queen': getQueenSteps,
      'king': getKingSteps,
    };

List<int> getWhitePawnSteps(int index) {
  var line = index % width;
  var row = (index / width).floor();
  if (row == 0) {
    return [];
  }
  var possibilities = <int>[
    checkMove(line + 1, row + 1),
    checkMove(line, row + 1),
    checkMove(line - 1, row + 1),
  ];
  if (row == 1) {
    possibilities.add(checkMove(line, row + 2));
  }
  possibilities.removeWhere((element) => element < 0);
  return possibilities;
}

List<int> getBlackPawnSteps(int index) {
  var line = index % width;
  var row = (index / width).floor();
  if (row == 7) {
    return [];
  }
  var possibilities = <int>[
    checkMove(line + 1, row - 1),
    checkMove(line, row - 1),
    checkMove(line - 1, row - 1),
  ];
  if (row == 6) {
    possibilities.add(checkMove(line, row - 2));
  }
  possibilities.removeWhere((element) => element < 0);
  return possibilities;
}

List<int> getRookSteps(int index) {
  var line = index % width;
  var row = (index / width).floor();
  var possibilities = <int>[
    checkMove(line, row + 1),
    checkMove(line, row + 2),
    checkMove(line, row + 3),
    checkMove(line, row + 4),
    checkMove(line, row + 5),
    checkMove(line, row + 6),
    checkMove(line, row + 7),
    checkMove(line, row - 1),
    checkMove(line, row - 2),
    checkMove(line, row - 3),
    checkMove(line, row - 4),
    checkMove(line, row - 5),
    checkMove(line, row - 6),
    checkMove(line, row - 7),
    checkMove(line + 1, row),
    checkMove(line + 2, row),
    checkMove(line + 3, row),
    checkMove(line + 4, row),
    checkMove(line + 5, row),
    checkMove(line + 6, row),
    checkMove(line + 7, row),
    checkMove(line - 1, row),
    checkMove(line - 2, row),
    checkMove(line - 3, row),
    checkMove(line - 4, row),
    checkMove(line - 5, row),
    checkMove(line - 6, row),
    checkMove(line - 7, row),
  ];
  possibilities.removeWhere((element) => element < 0);
  return possibilities;
}

List<int> getKnightSteps(int index) {
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

List<int> getWhiteBishopSteps(int index) {
  if (index % 2 == 0) {
    return [];
  }
  return getBishopSteps(index);
}

List<int> getBlackBishopSteps(int index) {
  if (index % 2 == 1) {
    return [];
  }
  return getBishopSteps(index);
}

List<int> getBishopSteps(int index) {
  var line = index % width;
  var row = (index / width).floor();
  var possibilities = <int>[
    checkMove(line + 1, row + 1),
    checkMove(line + 2, row + 2),
    checkMove(line + 3, row + 3),
    checkMove(line + 4, row + 4),
    checkMove(line + 5, row + 5),
    checkMove(line + 6, row + 6),
    checkMove(line + 7, row + 7),
    checkMove(line - 1, row - 1),
    checkMove(line - 2, row - 2),
    checkMove(line - 3, row - 3),
    checkMove(line - 4, row - 4),
    checkMove(line - 5, row - 5),
    checkMove(line - 6, row - 6),
    checkMove(line - 7, row - 7),
    checkMove(line - 1, row + 1),
    checkMove(line - 2, row + 2),
    checkMove(line - 3, row + 3),
    checkMove(line - 4, row + 4),
    checkMove(line - 5, row + 5),
    checkMove(line - 6, row + 6),
    checkMove(line - 7, row + 7),
    checkMove(line + 1, row - 1),
    checkMove(line + 2, row - 2),
    checkMove(line + 3, row - 3),
    checkMove(line + 4, row - 4),
    checkMove(line + 5, row - 5),
    checkMove(line + 6, row - 6),
    checkMove(line + 7, row - 7),
  ];
  possibilities.removeWhere((element) => element < 0);
  return possibilities;
}

List<int> getQueenSteps(int index) {
  var line = index % width;
  var row = (index / width).floor();
  var possibilities = <int>[
    checkMove(line, row + 1),
    checkMove(line, row + 2),
    checkMove(line, row + 3),
    checkMove(line, row + 4),
    checkMove(line, row + 5),
    checkMove(line, row + 6),
    checkMove(line, row + 7),
    checkMove(line, row - 1),
    checkMove(line, row - 2),
    checkMove(line, row - 3),
    checkMove(line, row - 4),
    checkMove(line, row - 5),
    checkMove(line, row - 6),
    checkMove(line, row - 7),
    checkMove(line + 1, row),
    checkMove(line + 2, row),
    checkMove(line + 3, row),
    checkMove(line + 4, row),
    checkMove(line + 5, row),
    checkMove(line + 6, row),
    checkMove(line + 7, row),
    checkMove(line - 1, row),
    checkMove(line - 2, row),
    checkMove(line - 3, row),
    checkMove(line - 4, row),
    checkMove(line - 5, row),
    checkMove(line - 6, row),
    checkMove(line - 7, row),
    checkMove(line + 1, row + 1),
    checkMove(line + 2, row + 2),
    checkMove(line + 3, row + 3),
    checkMove(line + 4, row + 4),
    checkMove(line + 5, row + 5),
    checkMove(line + 6, row + 6),
    checkMove(line + 7, row + 7),
    checkMove(line - 1, row - 1),
    checkMove(line - 2, row - 2),
    checkMove(line - 3, row - 3),
    checkMove(line - 4, row - 4),
    checkMove(line - 5, row - 5),
    checkMove(line - 6, row - 6),
    checkMove(line - 7, row - 7),
    checkMove(line - 1, row + 1),
    checkMove(line - 2, row + 2),
    checkMove(line - 3, row + 3),
    checkMove(line - 4, row + 4),
    checkMove(line - 5, row + 5),
    checkMove(line - 6, row + 6),
    checkMove(line - 7, row + 7),
    checkMove(line + 1, row - 1),
    checkMove(line + 2, row - 2),
    checkMove(line + 3, row - 3),
    checkMove(line + 4, row - 4),
    checkMove(line + 5, row - 5),
    checkMove(line + 6, row - 6),
    checkMove(line + 7, row - 7),
  ];
  possibilities.removeWhere((element) => element < 0);
  return possibilities;
}

List<int> getKingSteps(int index) {
  var line = index % width;
  var row = (index / width).floor();
  var possibilities = <int>[
    checkMove(line + 1, row + 1),
    checkMove(line + 1, row),
    checkMove(line + 1, row - 1),
    checkMove(line, row - 1),
    checkMove(line, row + 1),
    checkMove(line - 1, row),
    checkMove(line - 1, row + 1),
    checkMove(line - 1, row - 1),
  ];
  possibilities.removeWhere((element) => element < 0);
  return possibilities;
}

int checkMove(int line, int row) {
  if (line < 0 || line >= width || row < 0 || row >= width) {
    return -1;
  }
  var index = line + row * width;
  return index;
}
