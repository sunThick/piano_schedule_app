import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piano_schedule_app/views/create_student_confirm_page.dart';
import 'package:piano_schedule_app/views/create_student_page.dart';

void toCreateStudentPage({required BuildContext context}) =>
    Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) => const CreateStudentPage()));

void toCreateStudentConfirmPage({required BuildContext context}) =>
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        builder: (context) => const CreateStudentConfirmPage()));
