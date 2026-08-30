import 'package:flutter/material.dart';
import 'package:kratos/model/Program.dart';

class ProgramList extends StatefulWidget {
  final List<Program> programs;

  const ProgramList({super.key, required this.programs});

  @override
  State<ProgramList> createState() => _ProgramListState(programs);
}

class _ProgramListState extends State<ProgramList> {
  final List<Program> programs;

  _ProgramListState(this.programs);

  void _addProgram() {
    setState(() {
      programs.add(
        Program("New Program ${programs.length}", [])
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class ProgramListElem extends StatelessWidget {
  final Program program;

  const ProgramListElem(this.program, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        color: Theme.of(context).colorScheme.inversePrimary
      ),
      child: Center(
        child: Text(
          program.Title,
          style: Theme.of(context).textTheme.bodyMedium
        ),
      ),
    );
  }
}