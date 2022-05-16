part of 'update_bank_name_bloc.dart';

abstract class UpdateBankNameEvent extends Equatable {
  const UpdateBankNameEvent();

  @override
  List<Object> get props => [];
}

class UpdateBankNameBankNumberChanged extends UpdateBankNameEvent {
  const UpdateBankNameBankNumberChanged(this.bankNumber);

  final String bankNumber;

  @override
  List<Object> get props => [bankNumber];
}

class UpdateBankNameBankNameChanged extends UpdateBankNameEvent {
  const UpdateBankNameBankNameChanged(this.newName);

  final String newName;

  @override
  List<Object> get props => [newName];
}

class UpdateBankNameSubmitted extends UpdateBankNameEvent {
  const UpdateBankNameSubmitted();
}