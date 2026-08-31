import 'Block.dart';

class Program {
  final String title;
  final List<Block> blocks;

  const Program(this.title, {required this.blocks});

  const Program.Default() : title = "Default Program", blocks = const [Block.Default()];

  String get Title {
    return title;
  }
}