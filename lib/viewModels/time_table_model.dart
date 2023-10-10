import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeTableProvider = ChangeNotifierProvider(
  ((ref) => TimeTableModel()
));

class TimeTableModel extends ChangeNotifier{
  
}