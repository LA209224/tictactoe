import 'package:tictactoe/model/EPawn.dart';

class Player {
  late Pawn pawn;
  late int score;

  Player({required this.pawn}) {
    score = 0;
  }

  Pawn getPawn() {
    return pawn;
  }

  void setPawn(Pawn pa) {
    pawn = pa;
  }

  int getScore() {
    return score;
  }

  void setScore(int sc) {
    score = sc;
  }
}
