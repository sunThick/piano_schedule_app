import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piano_schedule_app/constants/dialog.dart';
import 'package:piano_schedule_app/constants/list.dart';
import 'package:piano_schedule_app/viewModels/create_student_model.dart';

class CreateStudentConfirmPage extends ConsumerWidget {
  const CreateStudentConfirmPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreateStudentModel createStudentModel =
        ref.watch(createStudentProvider);
    final gradeValue = createStudentModel.gradeValue;
    return Scaffold(
      appBar: AppBar(
        title: const Text('確認画面'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(createStudentModel.secondNameKanji.text),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(createStudentModel.firstNameKanji.text)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(createStudentModel.secondNameKana.text),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(createStudentModel.firstNameKana.text)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(createStudentModel.gradeValue.toString())
                      ]),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: () {}, child: const Text('登録する')),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
