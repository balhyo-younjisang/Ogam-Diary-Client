import 'package:flutter/material.dart';
import 'package:ogam_diary/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: Stack(children: [
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
        )
      ]),
    );
  }
}
