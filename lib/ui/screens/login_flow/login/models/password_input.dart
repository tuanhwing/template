
import 'package:formz/formz.dart';
import 'package:template/core/extensions/string_extension.dart';

enum PasswordInputError { empty }

class PasswordInput extends FormzInput<String, PasswordInputError> {
// Call super.pure to represent an unmodified form input.
  const PasswordInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordInputError validator(String value) {
    return value?.isEmpty == true ? PasswordInputError.empty : null;
  }
}