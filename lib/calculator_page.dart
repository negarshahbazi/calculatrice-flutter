import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _input = '';
  String _output = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _output = '';
      } else if (value == '=') {
        try {
          _output = _evaluateExpression(_input);
        } catch (e) {
          _output = 'Erreur';
        }
      } else {
        _input += value;
      }
    });
  }

  String _evaluateExpression(String expression) {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, contextModel);
      return result.toString();
    } catch (e) {
      return 'Erreur';
    }
  }

  Widget _buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(20.0),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculatrice Flutter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(12.0),
            alignment: Alignment.centerRight,
            child: Text(
              _input,
              style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: const TextStyle(fontSize: 24.0, color: Colors.grey),
            ),
          ),
          Divider(),
          Column(
            children: [
              Row(
                children: <Widget>[
                  _buildButton('7', Colors.blue),
                  _buildButton('8', Colors.blue),
                  _buildButton('9', Colors.blue),
                  _buildButton('/', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('4', Colors.blue),
                  _buildButton('5', Colors.blue),
                  _buildButton('6', Colors.blue),
                  _buildButton('*', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('1', Colors.blue),
                  _buildButton('2', Colors.blue),
                  _buildButton('3', Colors.blue),
                  _buildButton('-', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('0', Colors.blue),
                  _buildButton('C', Colors.red),
                  _buildButton('=', Colors.green),
                  _buildButton('+', Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
