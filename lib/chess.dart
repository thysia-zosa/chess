export 'src/problems/knight_problem.dart';

import 'package:chess/src/problems/knight_problem.dart';

class Chess {
  List<String> arguments;
  Map<String, Function> get applications => {
        'knight-problem': knightProblem,
      };

  Chess(this.arguments) {
    _resolveArguments();
  }

  void _resolveArguments() {
    var args = arguments.toList();
    var firstArg = args.removeAt(0);
    var app = applications[firstArg];
    if (app != null) {
      app(args);
    }
  }

  void knightProblem(List<String> arguments) {
    try {
      if (arguments.length != 2) {
        throw ArgumentError();
      }
      var intList = <int>[];
      int i;
      arguments.forEach((element) {
        i = int.parse(element);
        intList.add(i);
      });
      intList.sort();
      KnightProblem(height: intList[0], width: intList[1]);
    } on Exception catch (_) {
      print('Usage: knight-problem <lengthOfOneSide> <lengthOfOtherSide>');
    }
  }
}
