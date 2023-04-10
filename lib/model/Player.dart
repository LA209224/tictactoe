import 'package:tictactoe/model/EPawn.dart';

class Player {
  late Pawn pawn;
  late int scoore;

  Player({required this.pawn}) {
    scoore = 0;
  }

  Pawn getPawn() {
    return pawn;
  }

  void setPawn(Pawn pa) {
    pawn = pa;
  }

  int getScoore() {
    print(scoore.toString());
    return scoore;
  }

  void setScoore(int sc) {
    scoore = sc;
  }
}
