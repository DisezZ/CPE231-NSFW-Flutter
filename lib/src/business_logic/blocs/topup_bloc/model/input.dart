import 'package:formz/formz.dart';

enum FromAccountNumberValidationError { empty }
enum ToMobileNumberValidationError { empty }
enum AmountValidationError { empty }

class FromAccountNumber
    extends FormzInput<String, FromAccountNumberValidationError> {
  const FromAccountNumber.pure() : super.pure('');
  const FromAccountNumber.dirty([String value = '']) : super.dirty(value);

  @override
  FromAccountNumberValidationError? validator(String? value) {
    if (value?.isNotEmpty == false) {
      return FromAccountNumberValidationError.empty;
    } else {
      return null;
    }
  }
}

class ToMobileNumber extends FormzInput<String, ToMobileNumberValidationError> {
  const ToMobileNumber.pure() : super.pure('');
  const ToMobileNumber.dirty([String value = '']) : super.dirty(value);

  @override
  ToMobileNumberValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : ToMobileNumberValidationError.empty;
  }
}

class Amount extends FormzInput<String, AmountValidationError> {
  const Amount.pure() : super.pure('');
  const Amount.dirty([String value = '']) : super.dirty(value);

  @override
  AmountValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : AmountValidationError.empty;
  }
}
