import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text('Dice'),
      ),
      body: DicePage(),
    );
    ;
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 2;

  void _changeDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Expanded(
              child: FlatButton(
            onPressed: () {
              _changeDice();
            },
            child: Image.asset("images/dice$leftDiceNumber.png"),
          )),
          SizedBox(height: 40),
          Expanded(
            child: FlatButton(
              onPressed: () {
                _changeDice();
              },
              child: Image.asset("images/dice$rightDiceNumber.png"),
            ),
          ),
          SizedBox(height: 40),
          FlatButton(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            onPressed: () {
              _changeDice();
            },
            child: Text("Roll Dice"),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
