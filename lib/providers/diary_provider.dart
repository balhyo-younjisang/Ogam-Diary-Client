import 'package:flutter/material.dart';

class DiaryProvider with ChangeNotifier {
  DateTime _writedDate = DateTime.now();
  String? _situation;
  String? _think;
  String? _emotion;
  String? _bodyAction;
  String? _action;

  DateTime? get writeDate => _writedDate;
  String? get situation => _situation;
  String? get think => _think;
  String? get emotion => _emotion;
  String? get bodyAction => _bodyAction;
  String? get action => _action;

  void updateDate(DateTime dateTime) {
    _writedDate = dateTime;
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

  void updateBodyAction(String bodyAction) {
    _bodyAction = bodyAction;
    notifyListeners();
  }

  void updateAction(String action) {
    _action = action;
    notifyListeners();
  }
}
