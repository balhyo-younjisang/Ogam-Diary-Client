import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:ogam_diary/models/user.dart';

class JoinProvider with ChangeNotifier {
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  void updateConfirmPassword(String confirm) {
    _confirmPassword = confirm;
    notifyListeners();
  }

  join() async {
    try {
      const String url =
          "https://port-0-ogam-diary-server-o0ynn2alrlkabzp.sel5.cloudtype.app/api/v1";

      final request = Uri.parse("$url/user/join");
      final response = await http.post(request, headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      }, body: {
        "email": _email,
        "password": _password,
        "confirmPassword": _confirmPassword
      });
      final jsonData = jsonDecode(response.body);

      return User.fromJson(jsonData);
    } catch (e) {
      return null;
    }
  }
}
