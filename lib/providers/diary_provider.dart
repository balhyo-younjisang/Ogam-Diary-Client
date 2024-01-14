import 'package:flutter/material.dart';

class DiaryProvider with ChangeNotifier {
  DateTime _writedDate = DateTime.now();
  String? _title;
  String? _situation;
  String? _think;
  String? _emotion;
  int? _score;
  String? _bodyAction;
  String? _action;

  DateTime? get writeDate => _writedDate;
  String? get title => _title;
  String? get situation => _situation;
  String? get think => _think;
  String? get emotion => _emotion;
  int? get score => _score;
  String? get bodyAction => _bodyAction;
  String? get action => _action;

  void updateDate(DateTime dateTime) {
    _writedDate = dateTime;
    notifyListeners();
  }

  void updateTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void updateSituation(String situation) {
    _situation = situation;
    notifyListeners();
  }

  void updateThink(String think) {
    _think = think;
    notifyListeners();
  }

  void updateEmotion(String emotion) {
    _emotion = emotion;
    notifyListeners();
  }

  void updateScore(int score) {
    _score = score;
    notifyListeners();
  }

  void updateBodyAction(String bodyAction) {
    _bodyAction = bodyAction;
    notifyListeners();
  }

  void updateAction(String action) {
    _action = action;
    notifyListeners();
  }
}
