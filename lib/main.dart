import 'package:flutter/material.dart';
import 'package:tictactoe/screens/BoardScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const BoardScreen(),
    );
  }
}