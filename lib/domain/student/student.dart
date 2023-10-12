import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
abstract class Student with _$Student {
  const factory Student({
    required String uid,
    required String name,
    required String grade,
  }) = _Student;
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}
