// Datei: calculator_ui.dart
import 'package:calculator/logic/calculator_logic.dart';
import 'package:flutter/material.dart';

class CalculatorUI {
  final CalculatorLogic logic;
  final Function updateState;

  CalculatorUI(this.logic, this.updateState);

  Widget buildDisplay() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              logic.history,
              style: const TextStyle(fontSize: 24, color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(
              logic.output,
              style: const TextStyle(fontSize: 64, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKeypad() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          buildKeypadRow(["C", "()", "%", "/"], Colors.deepOrange),
          buildKeypadRow(["7", "8", "9", "×"], Colors.grey[800]!),
          buildKeypadRow(["4", "5", "6", "-"], Colors.grey[800]!),
          buildKeypadRow(["1", "2", "3", "+"], Colors.grey[800]!),
          buildKeypadRow(["+/-", "0", ".", "="], Colors.grey[800]!),
        ],
      ),
    );
  }

  Widget buildKeypadRow(List<String> buttons, Color color) {
    return Row(
      children: buttons.map((button) => buildButton(button, color)).toList(),
    );
  }

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(20),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      logic.clearAll();
    } else if (logic.isOperation(buttonText)) {
      logic.handleOperation(buttonText);
    } else if (buttonText == "=") {
      logic.calculateResult();
    } else if (buttonText == "%") {
      logic.calculatePercentage();
    } else if (buttonText == "+/-") {
      logic.toggleSign();
    } else {
      logic.appendNumber(buttonText);
    }
    updateState();
  }
}
