import 'package:flutter/material.dart';
import 'package:kratos/model/Program.dart';

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