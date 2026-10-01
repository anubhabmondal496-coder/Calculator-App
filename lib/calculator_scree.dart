import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // ===========================================================================
  // 📍 WRITE YOUR CALCULATOR LOGIC HERE (PART 1: STATE VARIABLES)
  // ===========================================================================
  // Use these variables to store your equation and calculation result.
  String userInput = '';
  String finalResult = '';

  // ===========================================================================
  // 📍 WRITE YOUR CALCULATOR LOGIC HERE (PART 2: BUTTON TAP HANDLER)
  // ===========================================================================
  // This function is triggered whenever any button is tapped.
  // Implement your mathematical operations inside setState(() { ... }) here.
  void onButtonTap(String buttonText) {
    setState(() {
      // ✏️ TODO: Add your calculation logic here!
      //
      if (buttonText == 'AC') {
        userInput = '';
        finalResult = '';
      } else if (buttonText == 'DEL') {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      } else if (buttonText == '=') {
        try {
          if (userInput.contains('+')) {
            List<String> parts = userInput.split('+');
            if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
              double num1 = double.parse(parts[0]);
              double num2 = double.parse(parts[1]);
              double result = num1 + num2;
              finalResult = result.toString();
            }
          } else if (userInput.contains('-')) {
            List<String> parts = userInput.split('-');
            if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
              double num1 = double.parse(parts[0]);
              double num2 = double.parse(parts[1]);
              double result = num1 - num2;
              finalResult = result.toString();
            }
          } else if (userInput.contains('x')) {
            List<String> parts = userInput.split('x');
            if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
              double num1 = double.parse(parts[0]);
              double num2 = double.parse(parts[1]);
              double result = num1 * num2;
              finalResult = result.toString();
            }
          } else if (userInput.contains('/')) {
            List<String> parts = userInput.split('/');
            if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
              double num1 = double.parse(parts[0]);
              double num2 = double.parse(parts[1]);
              if (num2 == 0) {
                finalResult = "Division by ZERO not allowed";
              } else {
                double result = num1 / num2;
                finalResult = result.toString();
              }
            }
          }
          else if(userInput.contains('%')){
            List<String> parts = userInput.split('%');
            if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
              double num1 = double.parse(parts[0]);
              double num2 = double.parse(parts[1]);
              double result = num1 % num2;
              finalResult = result.toString();
            }
          }
        } catch (e) {
          finalResult = "Error";
        }
      } else {
        // Appends the tapped number or operator to userInput
        userInput += buttonText;
      }
    });
  }
  // ===========================================================================

  // List of buttons representing the calculator keypad
  final List<String> buttons = [
    'AC', 'DEL', '%', '/',
    '7', '8', '9', 'x',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '', '0', '.', '=',
  ];

  // Helper method to determine button background color in Light Theme
  Color getButtonBgColor(String text) {
    if (text == 'AC' || text == 'DEL' || text == '%') {
      return Colors.grey.shade300; // Light Grey for function buttons
    } else if (text == '/' || text == 'x' || text == '-' || text == '+' || text == '=') {
      return Colors.orangeAccent; // Orange / Accent for operator buttons
    } else {
      return Colors.white; // White for number buttons
    }
  }

  // Helper method to determine button text color in Light Theme
  Color getButtonTextColor(String text) {
    if (text == '/' || text == 'x' || text == '-' || text == '+' || text == '=') {
      return Colors.white; // White text on orange buttons
    } else {
      return Colors.black87; // Dark text on light buttons
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background
      appBar: AppBar(
        title: const Text(
          'Calculator made by Anubhab',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 2,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Display Screen Area (User input and result)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Input expression display
                    Text(
                      userInput.isEmpty ? '0' : userInput,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    // Result display
                    Text(
                      finalResult.isEmpty
                          ? ''
                          : (finalResult.startsWith('=')
                              ? finalResult
                              : '= $finalResult'),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            // Keypad Buttons Section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final buttonText = buttons[index];
                    return StyledElevatedButton(
                      text: buttonText,
                      bgColor: getButtonBgColor(buttonText),
                      textColor: getButtonTextColor(buttonText),
                      onTap: () => onButtonTap(buttonText),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Circular Elevated Button Widget
class StyledElevatedButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onTap;

  const StyledElevatedButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return const SizedBox.shrink(); // Empty space for spacer cell
    }

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: bgColor,
        foregroundColor: textColor,
        elevation: 3,
        shadowColor: Colors.black26,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}