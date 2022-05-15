part of 'deposit_bloc.dart';

abstract class DepositEvent extends Equatable {
  const DepositEvent();

  @override
  List<Object> get props => [];
}

class DepositToAccountNumberChanged extends DepositEvent {
  const DepositToAccountNumberChanged(this.toAccountNumber);

  final String toAccountNumber;

  @override
  List<Object> get props => [toAccountNumber];
}

class DepositAtmNumberChanged extends DepositEvent {
  const DepositAtmNumberChanged(this.atmNumber);

  final String atmNumber;

  @override
  List<Object> get props => [atmNumber];
}

class DepositAmountChanged extends DepositEvent {
  const DepositAmountChanged(this.amount);

  final String amount;

  @override
  List<Object> get props => [amount];
}

class DepositSubmitted extends DepositEvent {
  const DepositSubmitted();
}