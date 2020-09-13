import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      child: Image.asset(
        'images/jumpingbird.png'
      ),
    );
  }
}
