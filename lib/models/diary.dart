class Diary {
  final String situation;
  final String emotion;
  final String reaction;
  final String action;
  final String think;
  final DateTime date;

  Diary(
      {required this.situation,
      required this.reaction,
      required this.emotion,
      required this.think,
      required this.action,
      required this.date});

  factory Diary.fromJson(Map<String, dynamic> json) {
    return Diary(
        situation: json['situation'],
        reaction: json['reaction'],
        emotion: json['emotion'],
        think: json['think'],
        action: json['action'],
        date: json['date']);
  }
}
