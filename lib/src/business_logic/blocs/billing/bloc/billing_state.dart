part of 'billing_bloc.dart';

class BillingState extends Equatable {
  const BillingState({
    this.status = FormzStatus.pure,
    this.fromAccountNumber = const AccountNumberInput.pure(),
    this.billNumber = const MobileNumberInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput fromAccountNumber;
  final MobileNumberInput billNumber;

  BillingState copyWith({
    FormzStatus? status,
    AccountNumberInput? fromAccountNumber,
    MobileNumberInput? billNumber,
    MoneyInput? amount,
  }) {
    return BillingState(
      status: status ?? this.status,
      fromAccountNumber: fromAccountNumber ?? this.fromAccountNumber,
      billNumber: billNumber ?? this.billNumber,
    );
  }

  @override
  List<Object> get props => [
        status,
        fromAccountNumber,
        billNumber,
      ];
}
