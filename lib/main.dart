import 'dart:ffi';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> symbols = ['+', '-', '/', '*'];
  String? selectedItems = '+';

  final _rightTextController = TextEditingController();
  final _leftTextController = TextEditingController();

  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: SizedBox(
                width: 180,
                child: TextField(
                  controller: _leftTextController,
                  decoration: InputDecoration(
                    hintText: 'What\'s on your min',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: SizedBox(
                width: 180,
                child: TextField(
                  controller: _rightTextController,
                  decoration: InputDecoration(
                    hintText: 'What\'s on your min',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                int num1 = int.parse(_rightTextController.text);
                int num2 = int.parse(_leftTextController.text);
                total = num1+num2;
              });
            },
            child: Text(
              'Calculate',
              style: TextStyle(fontSize: 20),
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          total.toString(),
          style: TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}
