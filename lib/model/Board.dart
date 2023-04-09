import 'dart:math';

import 'package:tictactoe/model/EPawn.dart';
import 'package:tictactoe/model/Player.dart';

class Board {
  late int nbCase;
  late List<String> board;

  Board({required this.nbCase}) {
    //Génére la liste avec nbCase*nbCase (vide)
    board = List.filled(nbCase * nbCase, "");
  }

  int getNbCase() {
    return nbCase;
  }

  void setNbCase(int nb) {
    nbCase = nb;
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
  void generateRandomPosition(Pawn pawn) {
    if (board.contains("")) {
      int randomIndex = Random().nextInt(board.length);
      while (board[randomIndex] != "") {
        randomIndex = Random().nextInt(board.length);
      }
      board[randomIndex] = pawn.getString();
    }
  }

  //Vérifie si le joueur a gagné
  bool isWinner(Player player) {
    //Vérifie les lignes
    for (int i = 0; i < getNbCase() * getNbCase(); i += getNbCase()) {
      bool line = true;
      for (int j = 0; j < getNbCase(); j++) {
        if (getPosition(i + j) != player.getPawn().getString()) {
          line = false;
          break;
        }
      }
      if (line) {
        player.setScoore(player.getScoore() + 1);
        return true;
      }
    }

    //Vérifie les colonnes
    for (int i = 0; i < getNbCase(); i++) {
      bool col = true;
      for (int j = 0; j < getNbCase(); j++) {
        if (getPosition(i + j * getNbCase()) != player.getPawn().getString()) {
          col = false;
          break;
        }
      }
      if (col) {
        player.setScoore(player.getScoore() + 1);
        return true;
      }
    }

    //Vérifie la diagonale 1
    bool diag1 = true;
    for (int i = 0; i < getNbCase(); i++) {
      if (getPosition(i * (getNbCase() + 1)) != player.getPawn().getString()) {
        diag1 = false;
        break;
      }
    }
    if (diag1) {
      player.setScoore(player.getScoore() + 1);
      return true;
    }

    //Vérifie la diagonale 2
    bool diag2 = true;
    for (int i = 0; i < getNbCase(); i++) {
      if (getPosition((i + 1) * (getNbCase() - 1)) !=
          player.getPawn().getString()) {
        diag2 = false;
        break;
      }
    }
    if (diag2) {
      player.setScoore(player.getScoore() + 1);
      return true;
    }

    //Renvoie false pour match nul
    return false;
  }

  //Vérifie si c'est la fin de partie
  bool isEndGame(Player p1, Player p2) {
    if (isWinner(p1) || isWinner(p2) || !board.contains("")) {
      return true;
    }
    return false;
  }

  //Remet les valeurs vides
  void resetBoard() {
    board = List.filled(nbCase * nbCase, "");
  }
}
