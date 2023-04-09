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
  late int nbCase = 4;

  @override
  void initState() {
    super.initState();
    board = Board(nbCase: nbCase);
    player = Player("X");
  }

  void play(int index) {
    if (board.getPosition(index) == "") {
      setState(() {
        board.setPosition(index, player.getPawn());
        board.generateRandomPosition();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //App Bar avec titre et retour menu
        appBar: AppBar(title: const Text("Tic Tac Toe")),
        body: GridView.count(
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
                        style:
                            const TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ),
                  ));
            })));
  }
}
