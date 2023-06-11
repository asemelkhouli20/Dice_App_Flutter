import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.teal,
            appBar: AppBar(
                title: const Text('Dice app'),
                backgroundColor: const Color.fromRGBO(92, 137, 132, 1)),
            body: const SafeArea(
                child: Center(
                    child: Padding(
              padding: EdgeInsets.all(16.0),
              child: DiceMain(),
            )))));
  }
}

class DiceMain extends StatefulWidget {
  const DiceMain({super.key});

  @override
  State<DiceMain> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DiceMain> {
  int dice1 = Random().nextInt(6) + 1;
  int dice2 = Random().nextInt(6) + 1;
  String descrabtion = '';
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('Images/$dice1.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('Images/$dice2.png'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              descrabtion,
              textWidthBasis: TextWidthBasis.parent,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
        ],
      ),

      onPressed: () {
        randomDiceSet();
      },
    );
  }

  void randomDiceSet() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
      int sum = dice1 + dice2;
      descrabtion = 'The Sum = $sum\n';
      sum = sum % 2;
      if (sum == 0) {
        descrabtion += 'Even';
      } else {
        descrabtion += 'Odd';
      }
    });
  }
}
