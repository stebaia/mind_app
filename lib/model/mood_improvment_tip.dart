class MoodImprovementTip {
  final String title;
  final String creationDate;
  final String content;
  final String imagePath;

  MoodImprovementTip({
    required this.title,
    required this.creationDate,
    required this.content,
    required this.imagePath,
  });

  factory MoodImprovementTip.fromJson(Map<String, dynamic> json) {
    return MoodImprovementTip(
        title: json['titolo'],
        creationDate: json['data_creazione'],
        content: json['contenuto'],
        imagePath: json['imagePath']);
  }
}
