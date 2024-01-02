import 'package:ogam_diary/models/user.dart';
import 'package:flutter/widgets.dart';

class AuthService extends ChangeNotifier {
  User? getCurrentUser() {
    // 현재 유저에 대한 정보 리턴 , 로그인 되지 않은 경우 null 리턴
    return null;
  }
}
