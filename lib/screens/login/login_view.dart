import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogam_diary/providers/login_provider.dart';
import 'package:ogam_diary/utils/hexColor.dart';
import 'package:ogam_diary/widgets/button_widget.dart';
import 'package:ogam_diary/widgets/logoText_widget.dart';
import 'package:ogam_diary/widgets/textFormField_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context); // 로그인 프로바이더 호출

    return Scaffold(
        body: Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LogoTextWidget().renderLogoText(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(children: [
                  TextFormFieldWidget().renderTextFormField(
                      label: "이메일",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        // 인풋값이 변경될 때마다 프로바이더의 이메일 값 업데이트
                        loginProvider.updateEmail(val);
                      },
                      validator: (val) {
                        // 입력된 이메일 검사
                        if (val.isEmpty) {
                          return '이메일은 필수사항입니다.';
                        }

                        if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(val)) {
                          return '잘못된 이메일 형식입니다.';
                        }
                        return null;
                      }),
                  // margin start
                  const SizedBox(
                    height: 18.0,
                  ),
                  // margin end
                  TextFormFieldWidget().renderTextFormField(
                      label: "비밀번호",
                      isPassword: true,
                      onChanged: (val) {
                        // 인풋값이 변경될 때마다 프로바이더의 비밀번호 값 업데이트
                        loginProvider.updatePassword(val);
                      },
                      validator: (val) {
                        // 입력된 비밀번호 검사
                        if (val.isEmpty) {
                          return '비밀번호는 필수사항입니다.';
                        }
                        return null;
                      }),
                  // margin start
                  const SizedBox(
                    height: 18.0,
                  ),
                  // margin end
                  ButtonWidget().renderAuthButton(
                      label: "로그인",
                      onTapHandler: () async {
                        if (loginProvider.email.isEmpty ||
                            loginProvider.password.isEmpty) {
                          Get.snackbar("입력 오류!", "입력칸을 모두 채워주세요!",
                              icon: const Icon(Icons.email),
                              snackStyle: SnackStyle.GROUNDED);
                          return;
                        }

                        dynamic response = await loginProvider.login();

                        if (!context.mounted) return; // 비동기 작업이 끝나지 않았다면

                        if (response == null) {
                          Get.snackbar("로그인 실패", "이메일과 비밀번호를 확인해주세요",
                              icon: const Icon(Icons.warning),
                              snackStyle: SnackStyle.GROUNDED);
                        } else {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString("email", response.email);

                          if (!context.mounted) return;
                          Navigator.pushNamed(context, "home");
                        }
                      }),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "join"); // 페이지 이동
                      },
                      child: Text(
                        "오감일기가 처음이라면?",
                        style: TextStyle(
                            color: HexColor("#8338ec"),
                            fontFamily: "Gugi-Regular"),
                      ))
                ]),
              )
            ],
          )
        ],
      ),
    ));
  }
}
