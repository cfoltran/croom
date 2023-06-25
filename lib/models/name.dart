import 'package:formz/formz.dart';

enum NameValidationError { empty, notValid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    if (!RegExp(r'^[A-Za-z-]+$').hasMatch(value))
      return NameValidationError.notValid;
    return null;
  }
}
