import 'Exercise.dart';

class Workout{
  final String title;
  final List<Exercise> exercises;

  const Workout(this.title, {required this.exercises});

  const Workout.Default() : title = "Default Workout", exercises = const [Exercise.Default()];

  static Workout fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        'title': final String title,
        'exercises': final List<Map<String, Object?>> exercises,
      } => Workout(
          title,
          exercises: [ for (final raw in exercises) Exercise.fromJson(raw) ]
        ),
      _ => throw FormatException('Could not deserialize Workout, json=$json'),
    };
  }
}