import "dart:math";

import "package:flutter/material.dart";
import "package:tictactoe/model/Board.dart";
import "package:tictactoe/model/Player.dart";

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late Board board;
  late Player player;
  late Player computer;
  late int nbCase = 4;
  bool isEndGame = false;

  @override
  void initState() {
    super.initState();
    board = Board(nbCase: nbCase);
    player = Player("X");
    computer = Player("O");
  }

  void play(int index) {
    if (!isEndGame) {
      setState(() {
        board.setPosition(index, player.getPawn());
        isEndGame = board.isEndGame(player, computer);
      });
      if (!isEndGame) {
        setState(() {
          board.generateRandomPosition(computer.pawn);
          isEndGame = board.isEndGame(player, computer);
        });
      }
    } else {
      setState(() {
        isEndGame = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar avec titre et retour menu
      appBar: AppBar(title: const Text("Tic Tac Toe")),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: GridView.count(
                  //Max de case par ligne
                  crossAxisCount: nbCase,
                  //Génére le nombre de Case dans la GridView, index = position de la case
                  children: List.generate(nbCase * nbCase, (index) {
                    //Détecte si le container à été touché
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            play(index);
                          });
                        },
                        //Container qui contient la valeur de la case.
                        child: Container(
                          color: Colors.black12,
                          margin: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              board.getPosition(index),
                              style: const TextStyle(
                                  fontSize: 32, color: Colors.black),
                            ),
                          ),
                        ));
                  }))),
          Expanded(
            child: isEndGame
                ? Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          board.resetBoard();
                          isEndGame = false;
                        });
                      },
                      child: const Text('Rejouer'),
                    ),
                  )
                : Center(),
          ),
        ],
      ),
    );
  }
}
