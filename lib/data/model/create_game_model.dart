class SessionOption {
  final String title;
  final String description;
  final String imagePath;
  final bool isNew;

  SessionOption({
    required this.title,
    required this.description,
    required this.imagePath,
    this.isNew = false,
  });
}
