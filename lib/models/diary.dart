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
        situation: json['data']['situation'],
        reaction: json['data']['reaction'],
        emotion: json['data']['emotion'],
        think: json['data']['think'],
        action: json['data']['action'],
        date: json['data']['date']);
  }
}
