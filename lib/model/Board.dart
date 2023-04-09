import 'dart:math';

class Board {
  late int nbCase;
  late List<String> board;

  Board({required this.nbCase}) {
    //Génére la liste avec nbCase*nbCase (vide)
    board = List.filled(nbCase * nbCase, "");
  }

  int getSize() {
    return board.length;
  }

  String getPosition(int pos) {
    return board[pos];
  }

  void setPosition(int pos, String value) {
    board[pos] = value;
  }

  //Génére position aléatoire
  void generateRandomPosition() {
    if (board.contains("")) {
      int randomIndex = Random().nextInt(board.length);
      while (board[randomIndex] != "") {
        randomIndex = Random().nextInt(board.length);
      }
      board[randomIndex] = "O";
    }
  }
}
