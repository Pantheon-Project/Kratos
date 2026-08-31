import 'Workout.dart';

class Week{
  final List<Workout> workouts;

  const Week({required this.workouts});

  const Week.Default() : workouts = const [Workout.Default()];

  static Week fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        'workouts': final List<Map<String, Object?>> workouts,
      } => Week(
          workouts: [ for (final raw in workouts) Workout.fromJson(raw) ]
        ),
      _ => throw FormatException('Could not deserialize Week, json=$json'),
    };
  }
}