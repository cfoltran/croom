import 'package:formz/formz.dart';

enum AgeValidationError { empty, tooYoung }

class Age extends FormzInput<int, AgeValidationError> {
  const Age.pure() : super.pure(0);
  const Age.dirty([super.value = 0]) : super.dirty();

  @override
  AgeValidationError? validator(int? value) {
    if (value == null) return AgeValidationError.empty;
    if (value < 13) return AgeValidationError.tooYoung;
    return null;
  }
}
