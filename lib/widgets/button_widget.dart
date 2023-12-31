import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogam_diary/utils/hexColor.dart';

class ButtonWidget {
  Widget renderAuthButton(
      {required void Function() onTapHandler, required String label}) {
    return InkWell(
        onTap: onTapHandler,
        borderRadius: BorderRadius.circular(10.0),
        splashColor: Colors.blue.withOpacity(0.4),
        child: Ink(
          width: Get.width,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
              color: HexColor("#3FEE9F"),
              borderRadius: const BorderRadius.all(Radius.circular(5.0))),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: "Gugi-Regular",
            ),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
