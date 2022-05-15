part of 'pay_loan_bloc.dart';

class PayLoanState extends Equatable {
  const PayLoanState({
    this.status = FormzStatus.pure,
    this.fromAccountNumber = const AccountNumberInput.pure(),
    this.loanNumber = const AccountNumberInput.pure(),
    this.amount = const MoneyInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput fromAccountNumber;
  final AccountNumberInput loanNumber;
  final MoneyInput amount;

  PayLoanState copyWith({
    FormzStatus? status,
    AccountNumberInput? fromAccountNumber,
    AccountNumberInput? loanNumber,
    MoneyInput? amount,
  }) {
    return PayLoanState(
      status: status ?? this.status,
      fromAccountNumber: fromAccountNumber ?? this.fromAccountNumber,
      loanNumber: loanNumber ?? this.loanNumber,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object> get props => [
        status,
        fromAccountNumber,
        loanNumber,
        amount
      ];
}
