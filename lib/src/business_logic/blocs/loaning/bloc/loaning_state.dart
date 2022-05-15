part of 'loaning_bloc.dart';

class LoaningState extends Equatable {
  const LoaningState({
    this.status = FormzStatus.pure,
    this.forAccountNumber = const AccountNumberInput.pure(),
    this.amount = const MoneyInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput forAccountNumber;
  final MoneyInput amount;

  LoaningState copyWith({
    FormzStatus? status,
    AccountNumberInput? forAccountNumber,
    MoneyInput? amount,
  }) {
    return LoaningState(
      status: status ?? this.status,
      forAccountNumber: forAccountNumber ?? this.forAccountNumber,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object> get props => [
        status,
        forAccountNumber,
        amount
      ];
}
