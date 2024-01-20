import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ogam_diary/providers/diary_provider.dart';
import 'package:ogam_diary/utils/diary_argument.dart';
import 'package:ogam_diary/widgets/bottomSheet_widget.dart';
import 'package:ogam_diary/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class WritePage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    DiaryProvider diaryProvider = Provider.of<DiaryProvider>(context);
    TextEditingController situationArea = TextEditingController();
    TextEditingController thinkArea = TextEditingController();
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
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        const Text(
                          "기록할 사건을 입력해주세요",
                          style: TextStyle(fontFamily: "Gugi-Regular"),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextField(
                            autofocus: true,
                            style: const TextStyle(
                                fontSize: 12, fontFamily: "Gugi-Regular"),
                            controller: situationArea,
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            decoration: const InputDecoration(
                                hintText: "상황을 입력해주세요",
                                hintStyle:
                                    TextStyle(fontFamily: "Gugi-Regular"),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black12)))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "당시 든 생각은 어땠나요?",
                          style: TextStyle(fontFamily: "Gugi-Regular"),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: thinkArea,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          style: const TextStyle(
                              fontSize: 12, fontFamily: "Gugi-Regular"),
                          decoration: const InputDecoration(
                              hintText: "생각을 입력해주세요",
                              hintStyle: TextStyle(fontFamily: "Gugi-Regular"),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black12))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ButtonWidget().renderAuthButton(
                            onTapHandler: () {
                              diaryProvider.updateThink(thinkArea.text);
                              diaryProvider.updateSituation(situationArea.text);

                              thinkArea.dispose();
                              situationArea.dispose();

                              Navigator.pushNamed(context, "writeDetails",
                                  arguments: DiaryArgument(args.focusedDay));
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
