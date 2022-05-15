part of 'withdraw_bloc.dart';

abstract class WithdrawEvent extends Equatable {
  const WithdrawEvent();

  @override
  List<Object> get props => [];
}

class WithdrawFromAccountNumberChanged extends WithdrawEvent {
  const WithdrawFromAccountNumberChanged(this.fromAccountNumber);

  final String fromAccountNumber;

  @override
  List<Object> get props => [fromAccountNumber];
}

class WithdrawAtmNumberChanged extends WithdrawEvent {
  const WithdrawAtmNumberChanged(this.atmNumber);

  final String atmNumber;

  @override
  List<Object> get props => [atmNumber];
}

class WithdrawAmountChanged extends WithdrawEvent {
  const WithdrawAmountChanged(this.amount);

  final String amount;

  @override
  List<Object> get props => [amount];
}

class WithdrawSubmitted extends WithdrawEvent {
  const WithdrawSubmitted();
}