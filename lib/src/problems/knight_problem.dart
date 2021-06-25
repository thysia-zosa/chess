class KnightProblem {
  int height;
  int width;

  KnightProblem({
    required this.height,
    required this.width,
  }) {
    solveKnightProblem();
  }

  void solveKnightProblem() {
    try {
      if (height < 3 || width < 3 || (height + width) < 7) {
        throw ArgumentError.value(
            'Both sides must be at least 3, the sum of both at least 7');
      }
      print('done: $height, $width');
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
      print('data: $height, $width');
    }
  }
}
