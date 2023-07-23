import 'package:formz/formz.dart';

enum AgeValidationError { empty, tooYoung }

class Age extends FormzInput<int?, AgeValidationError> {
  const Age.pure() : super.pure(null);
  const Age.dirty([super.value]) : super.dirty();

  @override
  AgeValidationError? validator(int? value) {
    if (value == null) return AgeValidationError.empty;
    if (value < 12) return AgeValidationError.tooYoung;
    return null;
  }
}
