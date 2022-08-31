import 'package:calculator/btton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  String input = '0';

  Widget calbutton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: () => onPressedFun(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }

  onPressedFun(String buttonText) {
    print(buttonText);
    print(input);
    print(result);
    if (buttonText == '1' ||
        buttonText == '2' ||
        buttonText == '3' ||
        buttonText == '4' ||
        buttonText == '5' ||
        buttonText == '6' ||
        buttonText == '7' ||
        buttonText == '8' ||
        buttonText == '9' ||
        buttonText == '0' ||
        buttonText == '00' ||
        buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '÷' ||
        buttonText == 'X') {
      input += buttonText;
    }
    else if (buttonText == "C") {
      input = '0';
      result = '0';
    }
    else if (buttonText == '<-') {
      input = input.substring(0, input.length - 1);
      if (input == "") {
        input = '0';
      }
    }
    else if (buttonText == '=' ||
        (input.contains('+') ||
            input.contains('-') ||
            input.contains('X') ||
            input.contains('÷'))) {
      if (input.contains('X')) {

        List m =input.split('X');
        print(int.parse(m[0])*int.parse(m[1] ));

       result= (int.parse(m[0])*int.parse(m[1] )).toString();
      }
      else if (input.contains('+')) {
        List m =input.split('+');
        print(int.parse(m[0])+int.parse(m[1] ));

        result= (int.parse(m[0])+int.parse(m[1] )).toString();
      }
      else if (input.contains('-')) {        List m =input.split('-');
      print(int.parse(m[0])-int.parse(m[1] ));

      result= (int.parse(m[0])-int.parse(m[1] )).toString();
      }
      else if (input.contains('÷')) {        List m =input.split('÷');
      print(int.parse(m[0])/int.parse(m[1] ));

      result= (int.parse(m[0])/int.parse(m[1] )).toString();
      }
    } else {
      result = 'Error';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              input,
              textScaleFactor: 1.5,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              textScaleFactor: 2,
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      calbutton('C', 1, Colors.lightBlueAccent),
                      calbutton('<-', 1, Colors.tealAccent),
                      calbutton('X', 1, Colors.teal),
                    ]),
                    TableRow(children: [
                      calbutton('9', 1, Colors.blueGrey),
                      calbutton('8', 1, Colors.blueGrey),
                      calbutton('7', 1, Colors.blueGrey),
                    ]),
                    TableRow(children: [
                      calbutton('6', 1, Colors.blueGrey),
                      calbutton('5', 1, Colors.blueGrey),
                      calbutton('4', 1, Colors.blueGrey),
                    ]),
                    TableRow(children: [
                      calbutton('1', 1, Colors.blueGrey),
                      calbutton('2', 1, Colors.blueGrey),
                      calbutton('3', 1, Colors.blueGrey),
                    ]),
                    TableRow(children: [
                      calbutton('00', 1, Colors.blueGrey),
                      calbutton('0', 1, Colors.blueGrey),
                      calbutton('.', 1, Colors.teal),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .25,
                child: Table(
                  children: [
                    TableRow(children: [
                      calbutton('÷', 1, Colors.teal),
                    ]),
                    TableRow(children: [
                      calbutton('+', 1, Colors.teal),
                    ]),
                    TableRow(children: [
                      calbutton('-', 1, Colors.teal),
                    ]),
                    TableRow(children: [
                      calbutton('=', 2, Colors.lightBlueAccent),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
