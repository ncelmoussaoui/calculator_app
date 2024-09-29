// Datei: calculator_home.dart
import 'package:calculator/logic/calculator_logic.dart';
import 'package:calculator/ui/calculator_ui.dart';
import 'package:flutter/material.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  final CalculatorLogic _logic = CalculatorLogic();
  late final CalculatorUI _ui;

  @override
  void initState() {
    super.initState();
    _ui = CalculatorUI(_logic, _updateState);
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4A0E4E), Color(0xFF9E1A63)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _ui.buildDisplay(),
              _ui.buildKeypad(),
            ],
          ),
        ),
      ),
    );
  }
}
