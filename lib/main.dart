import 'package:flutter/material.dart';
import 'package:tictactoe/screens/HomeScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(
        title: 'Tic Tac Toe',
      ),
    );
  }
}
