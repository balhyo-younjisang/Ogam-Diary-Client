import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ogam_diary/models/diary.dart';

class ReadProvider with ChangeNotifier {
  Future<Diary> fetchGetDiary(String idx, String email) async {
    String apiUrl =
        "https://port-0-ogam-diary-server-o0ynn2alrlkabzp.sel5.cloudtype.app/api/v1";
    final request = Uri.parse("$apiUrl/diary/view/$idx?email=$email");
    final response = await http.get(request);

    final body = jsonDecode(response.body);
    Diary diary = Diary.fromJson(body['diary']);

    return diary;
  }
}
