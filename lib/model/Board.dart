class Board {
  late int nbCase;
  late List<String> board;

  Board({required this.nbCase}) {
    //génére la liste avec nbCase*nbCase (vide)
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
}
