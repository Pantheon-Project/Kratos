import 'Block.dart';

class Program {
  final String title;
  final List<Block> blocks;

  const Program(this.title, this.blocks);

  String get Title {
    return title;
  }
}