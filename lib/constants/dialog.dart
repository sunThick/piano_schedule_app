import 'package:flutter/cupertino.dart';
import 'package:piano_schedule_app/constants/list.dart';
import 'package:piano_schedule_app/viewModels/create_student_model.dart';

void gradePickerDialog(BuildContext context,
    {required CreateStudentModel createStudentModel}) {
  final gradeValue = createStudentModel.gradeValue;

  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      // padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: CupertinoPicker(
          magnification: 1.22,
          squeeze: 1.2,
          useMagnifier: true,
          itemExtent: 32.0,
          onSelectedItemChanged: (i) {
            final value = gradeList[i];
            createStudentModel.setGradeValue(value: value);
          },
          children: List<Widget>.generate(gradeList.length, (int index) {
            return Center(
              child: Text(
                gradeList[index],
              ),
            );
          }),
        ),
      ),
    ),
  );
}
