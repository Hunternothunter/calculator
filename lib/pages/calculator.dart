import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Add math_expressions package to evaluate expressions

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = ''; // Holds the current equation
  String result = '0'; // Holds the result of the equation

  // Function to build number and operator buttons
  Widget _buildCardNumber(String buttonText) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16), // Adjust padding for smaller buttons
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.grey[200],
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 24, // Smaller font size
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      onPressed: () {
        setState(() {
          if (buttonText == "=") {
            // Evaluate the equation when "=" is pressed
            _evaluateEquation();
          } else if (buttonText == "C") {
            // Clear the equation and result
            equation = '';
            result = '0';
          } else {
            // Add the pressed number/operator to the equation
            equation += buttonText;
          }
        });
      },
    );
  }

  // Function to evaluate the equation
  void _evaluateEquation() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(equation);
      ContextModel cm = ContextModel();
      final evalResult = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        result = evalResult.toString();
      });
      equation = '';
    } catch (e) {
      setState(() {
        result = '0'; // Show error if equation is invalid
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Set the max width for the card to ensure it doesn't get too large
    double maxCardWidth = 350; // Max width for the Card (adjustable)

    // Determine the number of columns based on the screen size
    int crossAxisCount = screenWidth < 400
        ? 4
        : 4; // 4 columns for mobile and large screens (adjustable)

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                // Wrap the Card widget with a Center widget to limit its width
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth:
                          maxCardWidth, // Restrict the max width of the Card
                    ),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          // Equation and Result fields inside the Card
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                // Equation TextField
                                TextField(
                                  controller:
                                      TextEditingController(text: equation),
                                  readOnly: true,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Result TextField
                                TextField(
                                  controller:
                                      TextEditingController(text: result),
                                  readOnly: true,
                                  style: const TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                  textAlign: TextAlign.end,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Result',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Grid of buttons (numbers and operators)
                          GridView.count(
                            crossAxisCount:
                                crossAxisCount, // Number of columns in grid
                            shrinkWrap: true, // Shrink to fit the content
                            physics:
                                const NeverScrollableScrollPhysics(), // Disable scrolling in GridView
                            children: [
                              _buildCardNumber(
                                  "C"), // Button to clear the equation
                              _buildCardNumber("C"),
                              _buildCardNumber("C"),
                              _buildCardNumber("/"),

                              _buildCardNumber("7"),
                              _buildCardNumber("8"),
                              _buildCardNumber("9"),
                              _buildCardNumber("*"),

                              _buildCardNumber("4"),
                              _buildCardNumber("5"),
                              _buildCardNumber("6"),
                              _buildCardNumber("+"),

                              _buildCardNumber("1"),
                              _buildCardNumber("2"),
                              _buildCardNumber("3"),
                              _buildCardNumber("-"),

                              _buildCardNumber("0"),
                              _buildCardNumber("."),
                              _buildCardNumber(""),
                              _buildCardNumber("="),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
