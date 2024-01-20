import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ogam_diary/models/diary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider with ChangeNotifier {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  DateTime get focusedDay => _focusedDay;
  DateTime? get selectedDay => _selectedDay;

  void updateFocusedDay(DateTime focusedDay) {
    _focusedDay = focusedDay;
    notifyListeners();
  }

  void updateSelectedDay(DateTime selectedDay) {
    _selectedDay = selectedDay;
    notifyListeners();
  }

  Future<List<Diary>> getDiaryList(DateTime selectedDay) async {
    String date = DateFormat("yyyy-MM-dd").format(selectedDay);
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("email");

    const String apiUrl =
        "https://port-0-ogam-diary-server-o0ynn2alrlkabzp.sel5.cloudtype.app/api/v1";
    final request = Uri.parse("$apiUrl/diary/list/$date?email=$email");
    final response = await http.get(request);

    final body = jsonDecode(response.body);
    List<Diary> list =
        body['diaryList'].map<Diary>((i) => Diary.fromJson(i)).toList();

    return list;
  }
}
