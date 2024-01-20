import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ogam_diary/models/Diary.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Diary>? _diaryList;

  DateTime get focusedDay => _focusedDay;
  DateTime? get selectedDay => _selectedDay;
  List<Diary>? get diaryList => _diaryList;

  void updateFocusedDay(DateTime focusedDay) {
    _focusedDay = focusedDay;
    notifyListeners();
  }

  void updateSelectedDay(DateTime selectedDay) {
    _selectedDay = selectedDay;
    notifyListeners();
  }

  Future<dynamic> getDiaryList(DateTime selectedDay) async {
    const String apiUrl =
        "https://port-0-ogam-diary-server-o0ynn2alrlkabzp.sel5.cloudtype.app/api/v1";
    final request = Uri.parse("$apiUrl/diary/write");

    final response = await http.post(request);
    return jsonDecode(response.body);
  }
}
