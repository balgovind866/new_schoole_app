class FeedItem {
  final String id;
  final String userName;
  final String userImagePath;
  final String postImagePath;
  final String caption;
  final String timeAgo;
  int likesCount;
  bool isLiked;
  final bool hasAudio;
  final String audioTitle;
  final String? overlayTitle;
  final String? overlaySubtitle;
  final String? overlayText;
  int commentCount;

  FeedItem({
    required this.id,
    required this.userName,
    required this.userImagePath,
    required this.postImagePath,
    required this.caption,
    required this.timeAgo,
    required this.likesCount,
    this.isLiked = false,
    this.hasAudio = false,
    this.audioTitle = '',
    this.overlayTitle,
    this.overlaySubtitle,
    this.overlayText,
    this.commentCount = 0,
  });
}
