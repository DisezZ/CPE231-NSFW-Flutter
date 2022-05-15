part of 'transfer_bloc.dart';

class TransferState extends Equatable {
  const TransferState({
    this.status = FormzStatus.pure,
    this.fromAccountNumber = const AccountNumberInput.pure(),
    this.toAccountNumber = const MobileNumberInput.pure(),
    this.amount = const MoneyInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput fromAccountNumber;
  final MobileNumberInput toAccountNumber;
  final MoneyInput amount;

  TransferState copyWith({
    FormzStatus? status,
    AccountNumberInput? fromAccountNumber,
    MobileNumberInput? toAccountNumber,
    MoneyInput? amount,
  }) {
    return TransferState(
      status: status ?? this.status,
      fromAccountNumber: fromAccountNumber ?? this.fromAccountNumber,
      toAccountNumber: toAccountNumber ?? this.toAccountNumber,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object> get props => [
        status,
        fromAccountNumber,
        toAccountNumber,
        amount,
      ];
}
