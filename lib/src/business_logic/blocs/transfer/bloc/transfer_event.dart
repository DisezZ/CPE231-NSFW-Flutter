part of 'transfer_bloc.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class TransferFromAccountNumberChanged extends TransferEvent {
  const TransferFromAccountNumberChanged(this.fromAccountNumber);

  final String fromAccountNumber;

  @override
  List<Object> get props => [fromAccountNumber];
}

class TransferToAccountNumberChanged extends TransferEvent {
  const TransferToAccountNumberChanged(this.toAccountNumber);

  final String toAccountNumber;

  @override
  List<Object> get props => [toAccountNumber];
}

class TransferAmountChanged extends TransferEvent {
  const TransferAmountChanged(this.amount);

  final String amount;

  @override
  List<Object> get props => [amount];
}

class TransferSubmitted extends TransferEvent {
  const TransferSubmitted();
}