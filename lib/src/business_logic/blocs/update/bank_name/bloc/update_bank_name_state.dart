part of 'update_bank_name_bloc.dart';

class UpdateBankNameState extends Equatable {
  const UpdateBankNameState({
    this.status = FormzStatus.pure,
    this.bankNumber = const AccountNumberInput.pure(),
    this.newName= const MobileNumberInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput bankNumber;
  final MobileNumberInput newName;


  UpdateBankNameState copyWith({
    FormzStatus? status,
    AccountNumberInput? bankNumber,
    MobileNumberInput? newName,
  }) {
    return UpdateBankNameState(
      status: status ?? this.status,
      bankNumber: bankNumber ?? this.bankNumber,
      newName: newName ?? this.newName,
    );
  }

  @override
  List<Object> get props => [
        status,
        bankNumber,
        bankNumber  ,
      ];
}
