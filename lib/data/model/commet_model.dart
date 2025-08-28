class Comment {
  final int id;
  final String username;
  final String time;
  final String text;
  final int likes;
  final bool hasTranslation;
  final List<String> mentions;

  Comment({
    required this.id,
    required this.username,
    required this.time,
    required this.text,
    this.likes = 0,
    this.hasTranslation = false,
    this.mentions = const [],
  });
}

// Comment Controller using GetX

