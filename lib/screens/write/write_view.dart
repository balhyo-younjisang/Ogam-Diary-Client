import 'package:flutter/material.dart';
import 'package:ogam_diary/args/diaryArgument.dart';

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
        title: Text(args.focusedDay.toString()),
        actions: [
          IconButton(
              onPressed: () => {},
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
