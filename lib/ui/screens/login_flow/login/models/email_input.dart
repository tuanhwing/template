
import 'package:formz/formz.dart';
import 'package:template/core/extensions/string_extension.dart';

enum EmailInputError { empty, invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailInputError validator(String value) {
    return value?.isEmpty == true ? EmailInputError.empty : value.isValidEmail() ? null : EmailInputError.invalid;
  }
}