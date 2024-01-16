import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ogam_diary/providers/write_provider.dart';
import 'package:ogam_diary/utils/diary_argument.dart';
import 'package:ogam_diary/widgets/bottomSheet_widget.dart';
import 'package:ogam_diary/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class WriteDetailsPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  WriteDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    WriteProvder writeProvder = Provider.of<WriteProvder>(context);
    TextEditingController reactionArea = TextEditingController();
    TextEditingController actionArea = TextEditingController();
    final args = ModalRoute.of(context)!.settings.arguments as DiaryArgument;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => {Navigator.pushNamed(context, "home")},
        ),
        title: Text(
          DateFormat("MM월 dd의 기록").format(args.focusedDay),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Gugi-Regular",
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => {BottomSheetWidget().showBottomSheet()},
              icon: const Icon(Icons.help_outline_outlined))
        ],
      ),
      body: SafeArea(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      child: Column(children: [
                        const Text(
                          "감정을 선택해주세요",
                          style: TextStyle(fontFamily: "Gugi-Regular"),
                        ),
                        DropdownButton(
                          items: writeProvder.emotionList.map(
                            (value) {
                              return DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        fontFamily: "Gugi-Regular"),
                                  ));
                            },
                          ).toList(),
                          onChanged: (value) {
                            writeProvder.updateSelectedEmotion(value!);
                          },
                          value: writeProvder.selectedEmotion,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "신체반응을 입력해주세요",
                          style: TextStyle(fontFamily: "Gugi-Regular"),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextField(
                          style: const TextStyle(
                              fontSize: 12, fontFamily: "Gugi-Regular"),
                          controller: reactionArea,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          decoration: const InputDecoration(
                              hintText: "신체반응을 입력해주세요",
                              hintStyle: TextStyle(fontFamily: "Gugi-Regular"),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black12))),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          "행동을 입력해주세요",
                          style: TextStyle(fontFamily: "Gugi-Regular"),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextField(
                          style: const TextStyle(
                              fontSize: 12, fontFamily: "Gugi-Regular"),
                          controller: actionArea,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          decoration: const InputDecoration(
                              hintText: "행동을 입력해주세요",
                              hintStyle: TextStyle(fontFamily: "Gugi-Regular"),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black12))),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ButtonWidget().renderAuthButton(
                            onTapHandler: () {
                              Navigator.pushNamed(context, "writeDetails");
                            },
                            label: "다음 페이지로")
                      ]))
                ],
              ),
            )),
      ),
    );
  }
}
