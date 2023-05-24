// sm2_algorithm.dart
class SM2Algorithm {
  static const double _defaultEasinessFactor = 2.5;

  static double calculateEasinessFactor(double previousEasinessFactor, int quality) {
    if (quality < 3) {
      return previousEasinessFactor;
    } else {
      return previousEasinessFactor + 0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02);
    }
  }

  static int calculateRepetitions(int previousRepetitions, int quality) {
    if (quality < 3) {
      return 0;
    } else if (previousRepetitions == 0) {
      return 1;
    } else if (previousRepetitions == 1) {
      return 2;
    } else {
      return previousRepetitions + 1;
    }
  }

  static int calculateInterval(int previousInterval, int repetitions, double easinessFactor) {
    if (repetitions == 0) {
      return 1;
    } else if (repetitions == 1) {
      return 6;
    } else {
      return (previousInterval * easinessFactor).round();
    }
  }
}
