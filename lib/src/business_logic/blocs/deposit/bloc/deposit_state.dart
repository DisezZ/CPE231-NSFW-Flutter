part of 'deposit_bloc.dart';

class DepositState extends Equatable {
  const DepositState({
    this.status = FormzStatus.pure,
    this.toAccountNumber = const AccountNumberInput.pure(),
    this.atmNumber = const MobileNumberInput.pure(),
    this.amount = const MoneyInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput toAccountNumber;
  final MobileNumberInput atmNumber;
  final MoneyInput amount;

  DepositState copyWith({
    FormzStatus? status,
    AccountNumberInput? toAccountNumber,
    MobileNumberInput? atmNumber,
    MoneyInput? amount,
  }) {
    return DepositState(
      status: status ?? this.status,
      toAccountNumber: toAccountNumber ?? this.toAccountNumber,
      atmNumber: atmNumber ?? this.atmNumber,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object> get props => [
        status,
        toAccountNumber,
        atmNumber,
        amount
      ];
}
