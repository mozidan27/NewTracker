class Task {
  String title;
  String description;
  DateTime dueDate;
  String priority;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    this.isCompleted = false,
  });
}
