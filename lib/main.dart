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
                width: 160,
                child: TextField(
                  controller: _leftTextController,
                  decoration: InputDecoration(
                    hintText: 'Enter a numbber',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Spacer(),
            DropdownButton<String>(
              onChanged: (String? newValue){
                setState(() {
                  selectedItems = newValue!;
                });
              },
                value: selectedItems,
                items: symbols.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(fontSize: 22.0),),
                    );
                  },
                ).toList(),
              ),
              Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: SizedBox(
                width: 160,
                child: TextField(
                  controller: _rightTextController,
                  decoration: InputDecoration(
                    hintText: 'Enter a numbber',
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
                int num1 = int.parse(_leftTextController.text);
                int num2 = int.parse(_rightTextController.text);
                //total = num1 + num2;
                total = Calculate(num1,num2,selectedItems!);
              });
            },
            child: SizedBox(height: 50,width: 90,
              child: Text(
                'Calculate',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20),
              ),
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

int Calculate(int num1,int num2,String symbol)
{
  int result = 0;
  if(symbol == '+')
  {
    return result = num1 + num2;
  }
  else if(symbol == '-')
  {
    return result = num1 - num2;
  }
  else if(symbol == '*')
  {
    return result = num1 * num2;
  }
  else if(symbol == '/')
  {
    return result = num1 ~/ num2;
  }

  return 0;
}
