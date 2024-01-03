import 'package:flutter/material.dart';
import 'package:ogam_diary/providers/join_provider.dart';
import 'package:ogam_diary/utils/hexColor.dart';
import 'package:ogam_diary/widgets/button_widget.dart';
import 'package:ogam_diary/widgets/logoText_widget.dart';
import 'package:ogam_diary/widgets/textFormField_widget.dart';
import 'package:provider/provider.dart';

class JoinPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    JoinProvider joinProvider = Provider.of<JoinProvider>(context);

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
                        joinProvider.updateEmail(val);
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
                    height: 12.0,
                  ),
                  // margin end
                  TextFormFieldWidget().renderTextFormField(
                      label: "비밀번호",
                      isPassword: true,
                      onChanged: (val) {
                        // 인풋값이 변경될 때마다 프로바이더의 비밀번호 값 업데이트
                        joinProvider.updatePassword(val);
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
                    height: 12.0,
                  ),
                  TextFormFieldWidget().renderTextFormField(
                      label: "비밀번호 확인",
                      isPassword: true,
                      onChanged: (val) {
                        // 인풋값이 변경될 때마다 프로바이더의 비밀번호 확인 값 업데이트
                        joinProvider.updateConfirmPassword(val);
                      },
                      validator: (val) {
                        // 입력된 비밀번호 확인 검사
                        if (val != joinProvider.password) {
                          return '비밀번호가 일치하지 않습니다.';
                        }
                        if (val.isEmpty) {
                          return '비밀번호는 필수사항입니다.';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 12.0,
                  ),
                  // margin end
                  ButtonWidget().renderAuthButton(
                      label: "회원가입",
                      onTapHandler: () async {
                        await joinProvider.join();

                        if (!context.mounted) return; // 비동기 작업이 끝나지 않았다면
                        Navigator.pushNamed(context, "login");
                        return;
                      }),
                  // 페이지 이동
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "login");
                      },
                      child: Text(
                        "오감일기를 사용해본 적이 있나요?",
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
