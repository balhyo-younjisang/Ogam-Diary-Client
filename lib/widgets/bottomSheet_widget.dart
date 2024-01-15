import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetWidget {
  void showBottomSheet() {
    Get.bottomSheet(
        SizedBox(
          height: 400,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'DTR (일상적 사고 기록지) 란 무엇인가요?',
                style: TextStyle(fontSize: 12, fontFamily: "Gugi-Regular"),
              ),
              const SizedBox(height: 20),
              const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '일상적 사고 기록지는 자신이 일상 중 겪은 불쾌한 사건을 기록하는 기록지로 당시 상황과 그때 느낀 자신의 감정, 자동적 사고, 그에 대한 합리적인 행동과 결과로 구성되어 있어요. 사고기록지를 작성하면서 자신을 좀더 객관적으로 보게 되고 자기관찰 능력과 합리적 사고능력을 기를 수 있습니다.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Gugi-Regular',
                    ),
                  )),
              ElevatedButton(
                onPressed: Get.back,
                child: const Text(
                  '닫기',
                  style: TextStyle(fontSize: 12, fontFamily: "Gugi-Regular"),
                ),
              )
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.white);
  }
}
