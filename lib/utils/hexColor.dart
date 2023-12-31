import 'package:flutter/material.dart';

/// 헥스 컬러 코드를 rgb 값으로 변환하는 기능을 담고 있는 클래스
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", '');
    if (hexColor.length == 6) hexColor = 'FF$hexColor';

    return int.parse(hexColor, radix: 16);
  }
}
