import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pacman_bostonhacks/pixel.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 13;

  List<int> barriers = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfSquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numberInRow,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (barriers.contains(index)) {
                    return MyPixel(
                      innerColor: Colors.blue[800],
                      outerColor: Colors.blue[900],
                      child: Text(index.toString()),
                    );
                  }
                  else {
                    return MyPixel(
                      innerColor: Colors.yellow,
                      outerColor: Colors.black,
                      child: Text(index.toString()),
                    );
                  }
                }
              )
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Score: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'P L A Y',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
