import 'package:flutter/material.dart';
import 'package:ogam_diary/args/diaryArgument.dart';
import 'package:ogam_diary/providers/home_provider.dart';
import 'package:ogam_diary/widgets/button_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static CalendarFormat format = CalendarFormat.twoWeeks;

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

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
          onDaySelected: (selectedDay, focusedDay) {
            homeProvider.updateFocusedDay(focusedDay);
            homeProvider.updateSelectedDay(selectedDay);
          },
          onPageChanged: (focusedDay) {
            homeProvider.updateFocusedDay(focusedDay);
          },
          calendarFormat: format,
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
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
            label: "감정 기록하기")
      ]),
    ));
  }
}
