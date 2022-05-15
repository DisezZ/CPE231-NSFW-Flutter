part of 'topup_bloc.dart';

class TopupState extends Equatable {
  const TopupState({
    this.status = FormzStatus.pure,
    this.fromAccountNumber = const AccountNumberInput.pure(),
    this.toMobileNumber = const MobileNumberInput.pure(),
    this.amount = const MoneyInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput fromAccountNumber;
  final MobileNumberInput toMobileNumber;
  final MoneyInput amount;

  TopupState copyWith({
    FormzStatus? status,
    AccountNumberInput? fromAccountNumber,
    MobileNumberInput? toMobileNumber,
    MoneyInput? amount,
  }) {
    return TopupState(
      status: status ?? this.status,
      fromAccountNumber: fromAccountNumber ?? this.fromAccountNumber,
      toMobileNumber: toMobileNumber ?? this.toMobileNumber,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object> get props => [
        status,
        fromAccountNumber,
        toMobileNumber,
        amount,
      ];
}
