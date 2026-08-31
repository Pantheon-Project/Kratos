class Exercise {
  final String name;
  final String description;

  const Exercise(this.name, {required this.description});

  const Exercise.Default() : name = "Do Something Active", description = "There is no specific exercise here, just do something active and call it a day!";

  static Exercise fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        'name': final String name,
        'description': final String description,
      } => Exercise(
          name,
          description: description
        ),
      _ => throw FormatException('Could not deserialize Exercise, json=$json'),
    };
  }
}