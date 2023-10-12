import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final homePageProvider = ChangeNotifierProvider(((ref) => HomePageModel()));

class HomePageModel extends ChangeNotifier {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  CalendarFormat calendarFormat = CalendarFormat.month;

  void selectDay(DateTime day) {
    selectedDay = day;
    focusedDay = day;
    notifyListeners();
  }

  void changeFormat() {
    if (calendarFormat == CalendarFormat.month) {
      calendarFormat = CalendarFormat.week;
    } else {
      calendarFormat = CalendarFormat.month;
    }
    notifyListeners();
  }

  void changeFormatToWeek() {
    
  }


}
