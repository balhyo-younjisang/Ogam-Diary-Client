import 'package:flutter/material.dart';
import 'package:ogam_diary/providers/login_provider.dart';
import 'package:ogam_diary/utils/hexColor.dart';
import 'package:ogam_diary/widgets/button_widget.dart';
import 'package:ogam_diary/widgets/logoText_widget.dart';
import 'package:ogam_diary/widgets/textFormField_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

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
                        loginProvider.updateEmail(val);
                      },
                      validator: (val) {
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
                        loginProvider.updatePassword(val);
                      },
                      validator: (val) {
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
                        await loginProvider.login();

                        if (!context.mounted) return;
                        Navigator.pushNamed(context, "home");
                        return;
                      }),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "join");
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
