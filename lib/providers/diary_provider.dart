import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ogam_diary/models/diary.dart';

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

  Future<Diary?> fetchPostDiary(String email) async {
    try {
      debugPrint(_action);
      debugPrint(_bodyAction);
      debugPrint(_emotion);
      debugPrint(_situation);
      debugPrint(_think);
      debugPrint(_writedDate.toString());
      debugPrint(email);
      const String url =
          "https://port-0-ogam-diary-server-o0ynn2alrlkabzp.sel5.cloudtype.app/api/v1";

      final request = Uri.parse("$url/diary/write");
      final response = await http.post(request, headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      }, body: {
        "email": email,
        "situation": _situation,
        "think": _think,
        "emotion": _emotion,
        "reaction": _action,
        "action": _bodyAction,
        "date": _writedDate
      });
      final jsonData = jsonDecode(response.body);
      debugPrint(jsonData);

      return jsonData;
    } catch (e) {
      return null;
    }
  }
}
