part of 'pay_loan_bloc.dart';

abstract class PayLoanEvent extends Equatable {
  const PayLoanEvent();

  @override
  List<Object> get props => [];
}

class PayLoanFromAccountNumberChanged extends PayLoanEvent {
  const PayLoanFromAccountNumberChanged(this.fromAccountNumber);

  final String fromAccountNumber;

  @override
  List<Object> get props => [fromAccountNumber];
}

class PayLoanLoanNumberChanged extends PayLoanEvent {
  const PayLoanLoanNumberChanged(this.loanNumber);

  final String loanNumber;

  @override
  List<Object> get props => [loanNumber];
}

class PayLoanAmountChanged extends PayLoanEvent {
  const PayLoanAmountChanged(this.amount);

  final String amount;

  @override
  List<Object> get props => [amount];
}

class PayLoanSubmitted extends PayLoanEvent {
  const PayLoanSubmitted();
}