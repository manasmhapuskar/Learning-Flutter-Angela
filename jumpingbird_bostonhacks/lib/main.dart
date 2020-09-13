import 'package:flutter/material.dart';
import 'game_page.dart';

void main() {
  runApp(JumpingBird());
}

class JumpingBird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }
}


