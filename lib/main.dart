// Global Flutter imports
import 'package:flutter/material.dart';
// Import Pages
import 'pages/home.dart';
// Import Models
import 'package:kratos/model/Program.dart';

void main() {
  runApp(const Kratos());
}

class Kratos extends StatelessWidget {
  static const Program DEFAULT_PROGRAM = Program("Main Program", []);

  final Program active_program = DEFAULT_PROGRAM;

  const Kratos({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kratos',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.red),
      ),
      home: MyHomePage(programs: [active_program]),
    );
  }
}
