part of 'loaning_bloc.dart';

abstract class LoaningEvent extends Equatable {
  const LoaningEvent();

  @override
  List<Object> get props => [];
}

class LoaningForAccountNumberChanged extends LoaningEvent {
  const LoaningForAccountNumberChanged(this.forAccountNumber);

  final String forAccountNumber;

  @override
  List<Object> get props => [forAccountNumber];
}

class LoaningAmountChanged extends LoaningEvent {
  const LoaningAmountChanged(this.amount);

  final String amount;

  @override
  List<Object> get props => [amount];
}

class LoaningSubmitted extends LoaningEvent {
  const LoaningSubmitted();
}