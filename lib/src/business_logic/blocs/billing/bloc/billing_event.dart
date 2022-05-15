part of 'billing_bloc.dart';

abstract class BillingEvent extends Equatable {
  const BillingEvent();

  @override
  List<Object> get props => [];
}

class BillingFromAccountNumberChanged extends BillingEvent {
  const BillingFromAccountNumberChanged(this.fromAccountNumber);

  final String fromAccountNumber;

  @override
  List<Object> get props => [fromAccountNumber];
}

class BillingBillNumberChanged extends BillingEvent {
  const BillingBillNumberChanged(this.billNumber);

  final String billNumber;

  @override
  List<Object> get props => [billNumber];
}

class BillingSubmitted extends BillingEvent {
  const BillingSubmitted();
}