part of 'topup_bloc.dart';

abstract class TopupEvent extends Equatable {
  const TopupEvent();

  @override
  List<Object> get props => [];
}

class TopupFromAccountNumberChanged extends TopupEvent {
  const TopupFromAccountNumberChanged(this.fromAccountNumber);

  final String fromAccountNumber;

  @override
  List<Object> get props => [fromAccountNumber];
}

class TopupToMobileNumberChanged extends TopupEvent {
  const TopupToMobileNumberChanged(this.toMobileNumber);

  final String toMobileNumber;

  @override
  List<Object> get props => [toMobileNumber];
}

class TopupAmountChanged extends TopupEvent {
  const TopupAmountChanged(this.amount);

  final String amount;

  @override
  List<Object> get props => [amount];
}

class TopupSubmitted extends TopupEvent {
  const TopupSubmitted();
}