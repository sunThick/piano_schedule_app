import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piano_schedule_app/constants/routes.dart';
import 'package:piano_schedule_app/viewModels/home_page_model.dart';
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
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomePageModel homePageModel = ref.watch(homePageProvider);
    final focusedDay = homePageModel.focusedDay;
    final selectedDay = homePageModel.selectedDay;
    final calendarFormat = homePageModel.calendarFormat;

    return Scaffold(
        appBar: AppBar(),
        endDrawer: Drawer(
            child: ListView(
          children: [
            ListTile(
              title: Text('生徒登録'),
              onTap: () => toCreateStudentPage(context: context),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        )),
        body: Center(
          child: Column(
            children: [
              TableCalendar(
                locale: 'ja_JP',
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 143, 135),
                      shape: BoxShape.rectangle),
                  selectedDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 47, 32),
                      shape: BoxShape.rectangle),
                ),
                firstDay: DateTime.utc(2023, 10, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                focusedDay: focusedDay,
                calendarFormat: calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  homePageModel.selectDay(selectedDay);
                },
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
              TextButton(
                  onPressed: () => homePageModel.changeFormat(),
                  child: calendarFormat == CalendarFormat.week
                      ? const Icon(
                          CupertinoIcons.down_arrow,
                          color: Colors.red,
                        )
                      : const Icon(CupertinoIcons.up_arrow, color: Colors.red)),
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
