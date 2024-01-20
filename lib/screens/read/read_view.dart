import 'package:flutter/widgets.dart';
import 'package:ogam_diary/models/diary.dart';
import 'package:ogam_diary/providers/read_provider.dart';
import 'package:ogam_diary/utils/read_diary_arg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  late Diary diary;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final args =
          ModalRoute.of(context)!.settings.arguments as ReadDiaryArgument;
      ReadProvider readProvider =
          Provider.of<ReadProvider>(context, listen: false);

      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString("email");

      diary = await readProvider.fetchGetDiary(args.idx, email!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Text("Hi");
  }
}
