import 'Week.dart';

class Block {
  final List<Week> weeks;

  const Block({required this.weeks});

  const Block.Default() : weeks = const [Week.Default()];

  static Block fromJson(Map<String, Object?> json) {
      return switch (json) {
        {
          'weeks': final List<Map<String, Object?>> weeks,
        } => Block(
            weeks: [ for (final raw in weeks) Week.fromJson(raw) ]
          ),
        _ => throw FormatException('Could not deserialize Block, json=$json'),
      };
    }
}