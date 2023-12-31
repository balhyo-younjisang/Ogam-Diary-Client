import 'package:ogam_diary/models/user.dart';
import 'package:flutter/widgets.dart';

class AuthService extends ChangeNotifier {
  User? getCurrentUser() {
    // 현재 유저에 대한 정보 리턴 , 로그인 되지 않은 경우 null 리턴
    return null;
  }

  void signUp({
    required String email, // 필수 입력값 : 이메일
    required String password, // 필수 입력값 : 비밀번호
    required String confirmPasswrod, // 필수 입력값 : 비밀번호 확인
    required String onSuccess, // 가입 성공시 호출되는 함수
    required Function(String err) onError, // 에러 발생시 호출되는 함수
  }) async {
    // 회원가입 로직
  }

  void signIn({
    required String email,
    required String password,
    required String onSuccess,
    required Function(String err) onError,
  }) async {
    // 로그인 로직
  }

  void signOut() async {
    // 로그아웃
  }
}
