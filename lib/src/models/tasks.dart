class Task {
  Task({
    required this.startTime,
    required this.title,
    required this.endTime,
    this.photo,
  });

  final String startTime;
  final String title;
  final String endTime;
  final String? photo;
}
