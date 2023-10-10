import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageProvider = ChangeNotifierProvider(((ref) => HomePageModel()));

class HomePageModel extends ChangeNotifier {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  selectDay(DateTime day) {
    selectedDay = day;
    notifyListeners();
  }
}
