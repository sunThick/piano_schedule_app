import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final createStudentProvider =
    ChangeNotifierProvider(((ref) => CreateStudentModel()));

class CreateStudentModel extends ChangeNotifier {
  String? gradeValue = '学年を選択してください';
  final TextEditingController firstNameKanji = TextEditingController();
  final TextEditingController firstNameKana = TextEditingController();
  final TextEditingController secondNameKanji = TextEditingController();
  final TextEditingController secondNameKana = TextEditingController();

  void setGradeValue({required String? value}) {
    gradeValue = value!;
    notifyListeners();
  }
  
}
