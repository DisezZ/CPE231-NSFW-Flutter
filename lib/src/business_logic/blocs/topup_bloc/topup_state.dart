

part of 'topup_bloc.dart';

class TopupState extends Equatable {
  const TopupState({
    this.status = FormzStatus.pure,
    this.fromAccountNumber = const FromAccountNumber.pure(),
    this.toMobileNumber = const ToMobileNumber.pure(),
    this.amount = const Amount.pure(),
  });

  final FormzStatus status;
  final FromAccountNumber fromAccountNumber;
  final ToMobileNumber toMobileNumber;
  final Amount amount;

  TopupState copyWith({
    FormzStatus? status,
    FromAccountNumber? fromAccountNumber,
    ToMobileNumber? toMobileNumber,
    Amount? amount,
  }) {
    return TopupState(
      status: status ?? this.status,
      fromAccountNumber: fromAccountNumber ?? this.fromAccountNumber,
      toMobileNumber: toMobileNumber ?? this.toMobileNumber,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object> get props => [
        status,
        fromAccountNumber,
        toMobileNumber,
        amount,
      ];
}
