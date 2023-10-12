import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piano_schedule_app/constants/dialog.dart';
import 'package:piano_schedule_app/constants/list.dart';
import 'package:piano_schedule_app/constants/routes.dart';
import 'package:piano_schedule_app/viewModels/create_student_model.dart';

class CreateStudentPage extends ConsumerWidget {
  const CreateStudentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreateStudentModel createStudentModel =
        ref.watch(createStudentProvider);
    final gradeValue = createStudentModel.gradeValue;
    return Scaffold(
      appBar: AppBar(title: const Text('新規生徒登録')),
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                color: Colors.grey,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '名前を入力してください',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            textField(
                hintText: '山田',
                title: '姓',
                textEditingController: createStudentModel.secondNameKanji),
            const SizedBox(
              height: 10,
            ),
            textField(
                hintText: '太郎',
                title: '名',
                textEditingController: createStudentModel.firstNameKanji),
            const SizedBox(
              height: 10,
            ),
            textField(
                hintText: 'ヤマダ',
                title: 'セイ',
                textEditingController: createStudentModel.secondNameKana),
            const SizedBox(
              height: 10,
            ),
            textField(
                hintText: 'タロウ',
                title: 'メイ',
                textEditingController: createStudentModel.firstNameKana),
            const SizedBox(
              height: 10,
            ),
            Container(
                color: Colors.grey,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '学年を選んでください',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => gradePickerDialog(context,
                  createStudentModel: createStudentModel),
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      gradeValue.toString(),
                    ),
                  ))),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => toCreateStudentConfirmPage(context: context),
                child: const Text('確認へ'))
          ],
        ),
      )),
    );
  }
}

Widget textField(
    {required String hintText,
    required String title,
    required TextEditingController textEditingController}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(flex: 1, child: Text(title)),
      Flexible(
        flex: 5,
        child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: '例）$hintText')),
      ),
    ],
  );
}
