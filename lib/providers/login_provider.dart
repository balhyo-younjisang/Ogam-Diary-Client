import 'package:flutter/material.dart';

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

  Future<void> login() async {
    debugPrint("$_email $_password");
  }
}
