class TaskModal {
  final int id;
  final String title;
  final int userId;
  final bool completed;

  TaskModal({
    required this.id,
    required this.title,
    required this.userId,
    required this.completed,
  });

  factory TaskModal.fromJson(Map<String, dynamic> json) {
    return TaskModal(
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
      completed: json['completed'],
    );
  }
}
