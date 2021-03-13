
import 'package:formz/formz.dart';

enum EmailInputError { empty }

class EmailInput extends FormzInput<String, EmailInputError> {
  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailInputError validator(String value) {
    return value?.isNotEmpty == true ? null : EmailInputError.empty;
  }
}