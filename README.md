🧮 Flutter Calculator App

A simple and responsive calculator application built with Flutter and Dart. The app supports basic arithmetic operations, decimal calculations, deletion, clearing input, and division-by-zero handling.

✨ Features
➕ Addition
➖ Subtraction
✖️ Multiplication
➗ Division
🔢 Decimal number calculations
⌫ Delete the last entered character
🧹 AC (All Clear)
⚠️ Division-by-zero protection
📱 Android APK support
🎨 Clean and responsive Flutter UI
🛠️ Tech Stack
Flutter
Dart
Android
Material UI
📂 Project Structure
calculator/
│
├── lib/
│   └── main.dart
│
├── android/
├── ios/
├── web/
├── windows/
├── test/
│
├── pubspec.yaml
├── analysis_options.yaml
├── .gitignore
└── README.md
⚙️ Getting Started
1. Clone the repository
git clone <your-repository-url>
cd calculator
2. Install dependencies
flutter pub get
3. Run the application
flutter run

Make sure an Android device or emulator is connected.

📦 Build APK

To create a release APK:

flutter build apk --release

The generated APK will be available at:

build/app/outputs/flutter-apk/app-release.apk
🧮 Supported Operations
Operation	Example	Result
Addition	12 + 5	17
Subtraction	12 - 5	7
Multiplication	12 × 5	60
Division	12 ÷ 5	2.4
Decimal	12.5 + 3.2	15.7
Division by Zero

The calculator prevents invalid division:

10 / 0

Output:

Division by zero not allowed
🔮 Future Improvements
Scientific calculator functions
Calculation history
Parentheses and operator precedence
Percentage calculations
Dark/light themes
Improved UI animations
Landscape mode
Unit conversion
👨‍💻 Author

Anubhab Mondal

Computer Science & Engineering Student
Kalyani Government Engineering College

⭐ If you found this project useful, consider giving the repository a star!