import 'package:formz/formz.dart';

enum AccountNumberInputValidationError { empty }
enum MobileNumberInputValidationError { empty }
enum MoneyInputValidationError { empty }

class AccountNumberInput
    extends FormzInput<String, AccountNumberInputValidationError> {
  const AccountNumberInput.pure() : super.pure('');
  const AccountNumberInput.dirty([String value = '']) : super.dirty(value);

  @override
  AccountNumberInputValidationError? validator(String? value) {
    if (value?.isNotEmpty == false) {
      return AccountNumberInputValidationError.empty;
    } else {
      return null;
    }
  }
}

class MobileNumberInput extends FormzInput<String, MobileNumberInputValidationError> {
  const MobileNumberInput.pure() : super.pure('');
  const MobileNumberInput.dirty([String value = '']) : super.dirty(value);

  @override
  MobileNumberInputValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : MobileNumberInputValidationError.empty;
  }
}

class MoneyInput extends FormzInput<String, MoneyInputValidationError> {
  const MoneyInput.pure() : super.pure('');
  const MoneyInput.dirty([String value = '']) : super.dirty(value);

  @override
  MoneyInputValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : MoneyInputValidationError.empty;
  }
}
