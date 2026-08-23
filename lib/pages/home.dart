// Global Flutter imports
import 'package:flutter/material.dart';
// Import Views of this Page
import 'package:kratos/view/ProgramListElem.dart';
// Import Models
import 'package:kratos/model/Program.dart';

class MyHomePage extends StatefulWidget {
  final List<Program> programs;

  const MyHomePage({super.key, required this.programs});

  @override
  State<MyHomePage> createState() => _MyHomePageState(programs);
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Program> programs;

  _MyHomePageState(this.programs);

  void _addProgram() {
    setState(() {
      programs.add(
        Program("New Program ${programs.length}", [])
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Align(
          alignment: .center,
          child: Text("Kratos"),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            for (final program in programs)
              Row(
                spacing: 5.0,
                children: [
                  ProgramListElem(program)
                ],
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProgram,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
