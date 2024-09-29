// Datei: calculator_logic.dart
class CalculatorLogic {
  String output = "";
  String history = "";
  String currentNumber = "";
  double firstNumber = 0;
  String operation = "";

  void clearAll() {
    output = "0";
    history = "";
    currentNumber = "";
    firstNumber = 0;
    operation = "";
  }

  bool isOperation(String buttonText) {
    return ["+", "-", "×", "/"].contains(buttonText);
  }

  void handleOperation(String buttonText) {
    if (currentNumber.isNotEmpty) {
      firstNumber = double.parse(currentNumber);
      operation = buttonText;
      history = "$currentNumber $operation";
      currentNumber = "";
    }
  }

  void calculateResult() {
    if (currentNumber.isNotEmpty && operation.isNotEmpty) {
      double secondNumber = double.parse(currentNumber);
      double result = performOperation(firstNumber, secondNumber, operation);
      output = formatResult(result);
      history = "$firstNumber $operation $currentNumber";
      currentNumber = output;
      operation = "";
    }
  }

  double performOperation(double a, double b, String operation) {
    switch (operation) {
      case "+":
        return a + b;
      case "-":
        return a - b;
      case "×":
        return a * b;
      case "/":
        return a / b;
      default:
        return 0;
    }
  }

  String formatResult(double result) {
    return result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
  }

  void calculatePercentage() {
    if (currentNumber.isNotEmpty) {
      double number = double.parse(currentNumber);
      output = (number / 100).toString();
      currentNumber = output;
    }
  }

  void toggleSign() {
    if (currentNumber.isNotEmpty) {
      currentNumber = currentNumber.startsWith("-")
          ? currentNumber.substring(1)
          : "-$currentNumber";
      output = currentNumber;
    }
  }

  void appendNumber(String number) {
    currentNumber += number;
    output = currentNumber;
  }
}
