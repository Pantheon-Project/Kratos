// Global Flutter imports
import 'package:flutter/material.dart';
// Import Views of this Page
import 'package:kratos/view/ProgramList.dart';
// Import Models
import 'package:kratos/model/Program.dart';

class HomePage extends StatefulWidget {
  final List<Program> programs;

  const HomePage({super.key, required this.programs});

  @override
  State<HomePage> createState() => _HomePageState(programs);
}

class _HomePageState extends State<HomePage> {
  final List<Program> programs;

  _HomePageState(this.programs);

  @override
  Widget build(BuildContext context) {

    void _addProgram() {
      setState(() {
        programs.add(
          Program(
            "New Program ${programs.length}",
            blocks:[])
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Align(
          alignment: .center,
          child: Text(
            "Kratos",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        )
      ),
      body: Center(
        child: ProgramList(programs:programs)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProgram,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
