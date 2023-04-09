import "dart:math";

import "package:flutter/material.dart";
import "package:tictactoe/model/Board.dart";

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late Board board;
  late int nbCase = 4;
  @override
  void initState() {
    super.initState();
    board = Board(nbCase: nbCase);
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
              return Container(
                color: Colors.red,
                margin: const EdgeInsets.all(4),
                child: Center(
                  child: Text(
                    board.getPosition(index),
                    style: const TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
              );
            })));
  }
}
