import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String email = "";
  String password = "";

  void updateEmail(String email) {
    this.email = email;
  }

  void updatePassword(String password) {
    this.password = password;
  }
}
