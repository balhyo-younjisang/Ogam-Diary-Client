import 'package:flutter/material.dart';

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

  Future<void> join() async {}
}
