class VideoItem {
  final String urlImage;
  final String title;
  final String urlVideo;
  final String desc;
  final bool isLocked;

  const VideoItem(
      {required this.title,
      required this.urlImage,
      required this.urlVideo,
      required this.desc,
      required this.isLocked});
}
