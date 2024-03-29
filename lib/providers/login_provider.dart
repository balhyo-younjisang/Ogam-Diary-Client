import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ogam_diary/models/user.dart';

class LoginProvider with ChangeNotifier {
  String _email = "";
  String _password = "";

  String get email => _email;
  String get password => _password;

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  login() async {
    try {
      const String url =
          "https://port-0-ogam-diary-server-o0ynn2alrlkabzp.sel5.cloudtype.app/api/v1";

      final request = Uri.parse("$url/user/login");
      final response = await http.post(request,
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: {"email": _email, "password": _password});

      return User.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }
}
