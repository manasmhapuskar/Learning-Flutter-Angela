import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'barriers.dart';
import 'bird.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  static double birdYAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYAxis;
  bool hasGameStarted = false;

  static double barrierXOne = 1;
  double barrierXTwo = barrierXOne + 1;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYAxis;
    });
  }

  void startGame() {
    hasGameStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYAxis = initialHeight - height;
      });
      setState(() {
        if (barrierXOne < -1.5) {
          barrierXOne += 3.5;
        }
        else {
          barrierXOne -= 0.05;
        }
      });
      setState(() {
        if (barrierXTwo < -1.5) {
          barrierXTwo += 3.5;
        }
        else {
          barrierXTwo -= 0.05;
        }
      });

      if (birdYAxis > 1) {
        timer.cancel();
        hasGameStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (hasGameStarted) {
          jump();
        }
        else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Stack(
                children: <Widget>[
                  AnimatedContainer(
                    alignment: Alignment(0, birdYAxis),
                    duration: Duration(
                      milliseconds: 0,
                    ),
                    color: Colors.blue,
                    child: Bird(),
                  ),
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: hasGameStarted ? Text('') : Text(
                      'T A P  T O  P L A Y',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXOne, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 150.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXOne, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 150.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXTwo, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 100.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXTwo, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 200.0,
                    ),
                  ),
                ],
              )
            ),
            Container(
              height: 15.0,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'SCORE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'BEST',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          '10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
