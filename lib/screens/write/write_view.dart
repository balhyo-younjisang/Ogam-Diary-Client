import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ogam_diary/args/diaryArgument.dart';
import 'package:ogam_diary/widgets/bottomSheet_widget.dart';

class WritePage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  WritePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Column(
                children: [],
              ),
            )),
      ),
    );
  }
}
