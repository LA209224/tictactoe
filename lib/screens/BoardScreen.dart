import "package:flutter/material.dart";
import "package:tictactoe/model/Board.dart";
import "package:tictactoe/model/EPawn.dart";
import "package:tictactoe/model/Player.dart";

class BoardScreen extends StatefulWidget {
  final int nbCase;
  final Pawn pawn;

  const BoardScreen({Key? key, required this.nbCase, required this.pawn})
      : super(key: key);

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
    board = Board(nbCase: widget.nbCase);
    player = Player(pawn: widget.pawn);
    computer = Player(pawn: widget.pawn == Pawn.O ? Pawn.X : Pawn.O);
    if (widget.pawn == Pawn.O) {
      board.generateRandomPosition(computer.getPawn());
    }
  }

  void play(int index) {
    if (board.getPosition(index) == "" && !isEndGame) {
      setState(() {
        board.setPosition(index, player.getPawn().getString());
        isEndGame = board.isEndGame(player, computer);
      });
      if (!isEndGame) {
        setState(() {
          board.generateRandomPosition(computer.pawn);
          isEndGame = board.isEndGame(player, computer);
        });
      }
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
                  crossAxisCount: widget.nbCase,
                  //Génére le nombre de Case dans la GridView, index = position de la case
                  children:
                      List.generate(widget.nbCase * widget.nbCase, (index) {
                    //Détecte si le container à été touché
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            play(index);
                          });
                        },
                        //Container qui contient la valeur de la case.
                        child: Container(
                          color: isEndGame && board.isWinner(player)
                              ? Colors.green
                              : isEndGame && board.isWinner(computer)
                                  ? Colors.red
                                  : Colors.black12,
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
            //Affiche un bouton si la fin de la parti est vrai sinon il affiche le score
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
                : Center(
                    child: Text(
                        "${player.getPawn().getString()} ${player.getScore()} - ${computer.getScore()} ${computer.getPawn().getString()}"),
                  ),
          ),
        ],
      ),
    );
  }
}
