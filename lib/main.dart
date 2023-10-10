import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piano_schedule_app/viewModels/homePageModel.dart';
import 'package:piano_schedule_app/viewModels/timeTableModel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const ProviderScope(
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomePageModel homePageModel = ref.watch(homePageProvider);
    final TimeTableModel timeTableModel = ref.watch(timeTableProvider);
    final focusedDay = homePageModel.focusedDay;
    final selectedDay = homePageModel.selectedDay;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: [
              TableCalendar(
                locale: 'ja_JP',
                firstDay: DateTime.utc(2023, 10, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                focusedDay: focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  homePageModel.selectDay(selectedDay);
                },
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                ),
              ),
              Consumer(builder: (context, ref, _) {
                return ListView(
                  shrinkWrap: true,
                );
              }),
            ],
          ),
        ));
  }
}
