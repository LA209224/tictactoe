import 'package:flutter/material.dart';
import 'package:tictactoe/model/EPawn.dart';
import 'package:tictactoe/screens/BoardScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<int> gridOptions = [3, 4, 5];

class _HomeScreenState extends State<HomeScreen> {
  late Pawn choicePawn = Pawn.X;
  int nbCaseOption = 3; // valeur par défaut
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Radio Bouton via l'énum de X ou O
            ListTile(
              title: const Text("X"),
              leading: Radio<Pawn>(
                value: Pawn.X,
                groupValue: choicePawn,
                onChanged: (Pawn? value) {
                  setState(() {
                    choicePawn = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("O"),
              leading: Radio<Pawn>(
                value: Pawn.O,
                groupValue: choicePawn,
                onChanged: (Pawn? value) {
                  setState(() {
                    choicePawn = value!;
                  });
                },
              ),
            ),
            //Choix du nombre de case
            DropdownButton(
              value: nbCaseOption,
              items: gridOptions.map((int option) {
                String label = '$option x $option';
                return DropdownMenuItem(
                  value: option,
                  child: Text(label),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  nbCaseOption = newValue!;
                });
              },
            ),

            //Bouton pour lancer
            ElevatedButton(
              onPressed: () {
                if (nbCaseOption > 0) {
                  Navigator.push(
                      context,
                      //Envoie du nombre de case + le pawn (enum)
                      MaterialPageRoute(
                          builder: (context) => BoardScreen(
                              nbCase: nbCaseOption, pawn: choicePawn)));
                }
              },
              child: const Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}
