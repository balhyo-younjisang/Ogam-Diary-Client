import 'package:flutter/material.dart';
import 'package:ogam_diary/models/diary.dart';
import 'package:ogam_diary/utils/diary_argument.dart';
import 'package:ogam_diary/providers/home_provider.dart';
import 'package:ogam_diary/utils/read_diary_arg.dart';
import 'package:ogam_diary/widgets/button_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static CalendarFormat format = CalendarFormat.twoWeeks;
  List<Diary> diaryList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      HomeProvider homeProvider =
          Provider.of<HomeProvider>(context, listen: false);
      diaryList = await homeProvider.getDiaryList(homeProvider.focusedDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        TableCalendar(
          locale: "ko_KR",
          focusedDay: homeProvider.focusedDay,
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2099, 12, 31),
          selectedDayPredicate: (day) {
            return isSameDay(homeProvider.selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) async {
            homeProvider.updateFocusedDay(focusedDay);
            homeProvider.updateSelectedDay(selectedDay);
            final list = await homeProvider.getDiaryList(selectedDay);
            setState(() {
              diaryList = list;
            });
          },
          onPageChanged: (focusedDay) {
            homeProvider.updateFocusedDay(focusedDay);
          },
          calendarFormat: format,
          headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle:
                  TextStyle(fontFamily: "Gugi-Regular", fontSize: 16)),
          calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
              tablePadding: EdgeInsets.all(8.0),
              weekendTextStyle: TextStyle(fontSize: 14),
              defaultTextStyle: TextStyle(fontSize: 14),
              selectedTextStyle: TextStyle(fontSize: 14, color: Colors.white70),
              todayTextStyle: TextStyle(fontSize: 14, color: Colors.white70)),
        ),
        ButtonWidget().renderAuthButton(
            onTapHandler: () {
              Navigator.pushNamed(context, "write",
                  arguments: DiaryArgument(homeProvider.focusedDay));
            },
            label: "감정 기록하기"),
        Flexible(
            fit: FlexFit.tight,
            child: SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                  itemCount: diaryList.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "read",
                              arguments: ReadDiaryArgument(diaryList[idx].id));
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(10),
                          color: const Color.fromARGB(255, 204, 204, 204),
                          child: Center(
                            child: Text(diaryList[idx].situation),
                          ),
                        ));
                  },
                )))
      ]),
    ));
  }
}
