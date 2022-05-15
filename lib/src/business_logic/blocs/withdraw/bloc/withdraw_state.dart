part of 'withdraw_bloc.dart';

class WithdrawState extends Equatable {
  const WithdrawState({
    this.status = FormzStatus.pure,
    this.fromAccountNumber = const AccountNumberInput.pure(),
    this.atmNumber = const MobileNumberInput.pure(),
    this.amount = const MoneyInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput fromAccountNumber;
  final MobileNumberInput atmNumber;
  final MoneyInput amount;

  WithdrawState copyWith({
    FormzStatus? status,
    AccountNumberInput? fromAccountNumber,
    MobileNumberInput? atmNumber,
    MoneyInput? amount,
  }) {
    return WithdrawState(
      status: status ?? this.status,
      fromAccountNumber: fromAccountNumber ?? this.fromAccountNumber,
      atmNumber: atmNumber ?? this.atmNumber,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object> get props => [
        status,
        fromAccountNumber,
        atmNumber,
        amount
      ];
}
