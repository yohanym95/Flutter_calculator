import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operend = "";

  buttonPressed(String buttontext) {
    if (buttontext == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operend = "";
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "/" ||
        buttontext == "X") {
      num1 = double.parse(output);
      operend = buttontext;
      _output = "0";
    } else if (buttontext == ".") {
      if (_output.contains(".")) {
        print("Already Contain a decimals");
        return;
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == "=") {
      num2 = double.parse(output);
      if (operend == "+") {
        _output = (num1 + num2).toString();
      }
      if (operend == "-") {
        _output = (num1 - num2).toString();
      }
      if (operend == "/") {
        _output = (num1 / num2).toString();
      }
      if (operend == "X") {
        _output = (num1 * num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operend = "";
    } else {
      _output = _output + buttontext;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String text) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(25.0),
        child: new Text(
          text,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(text),
        // color: Colors.blueGrey,
        // textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: new Container( 
          child: new Column(
            children: <Widget>[
              new Container(
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12.0),
                  child: new Text(
                    output,
                    style: new TextStyle(
                        fontSize: 48.0, fontWeight: FontWeight.bold),
                  )),
              new Expanded(child: new Divider()),
              new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/"),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("X"),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-"),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      buildButton("."),
                      buildButton('0'),
                      buildButton("00"),
                      buildButton("+"),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      buildButton("CLEAR"),
                      buildButton("="),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
