import 'package:flutter/material.dart';

class LogoTextWidget {
  Widget renderLogoText() {
    return const Column(children: [
      Text(
        "오감일기",
        style: TextStyle(fontFamily: "Gugi-Regular", fontSize: 30, height: 3),
      ),
      Text(
        "감정으로 기록하는 오늘의 일기",
        style: TextStyle(
          fontFamily: "Gugi-Regular",
          fontSize: 16,
          height: 1.3,
        ),
      )
    ]);
  }
}
