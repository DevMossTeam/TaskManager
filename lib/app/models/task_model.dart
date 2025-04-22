class TaskModel {
  final String title;
  final String description;

  // Constructor with required fields
  TaskModel({
    required this.title,
    required this.description,
  });

  // Optionally, override toString for better readability
  @override
  String toString() {
    return 'TaskModel(title: $title, description: $description)';
  }

  // Optionally, add equality comparison and hashCode for object comparisons
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskModel &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;

  // If you plan on converting this to/from a map, you can add these methods
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}