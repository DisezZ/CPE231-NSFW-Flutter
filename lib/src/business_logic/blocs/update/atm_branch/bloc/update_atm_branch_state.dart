part of 'update_atm_branch_bloc.dart';

class UpdateAtmBranchState extends Equatable {
  const UpdateAtmBranchState({
    this.status = FormzStatus.pure,
    this.atmNumber = const AccountNumberInput.pure(),
    this.branchNumber= const MobileNumberInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput atmNumber;
  final MobileNumberInput branchNumber;


  UpdateAtmBranchState copyWith({
    FormzStatus? status,
    AccountNumberInput? atmNumber,
    MobileNumberInput? branchNumber,
  }) {
    return UpdateAtmBranchState(
      status: status ?? this.status,
      atmNumber: atmNumber ?? this.atmNumber,
      branchNumber: branchNumber ?? this.branchNumber,
    );
  }

  @override
  List<Object> get props => [
        status,
        atmNumber,
        atmNumber  ,
      ];
}
