part of 'update_employee_branch_bloc.dart';

class UpdateEmployeeBranchState extends Equatable {
  const UpdateEmployeeBranchState({
    this.status = FormzStatus.pure,
    this.employeeNumber = const AccountNumberInput.pure(),
    this.branchNumber= const AccountNumberInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput employeeNumber;
  final AccountNumberInput branchNumber;


  UpdateEmployeeBranchState copyWith({
    FormzStatus? status,
    AccountNumberInput? employeeNumber,
    AccountNumberInput? branchNumber,
  }) {
    return UpdateEmployeeBranchState(
      status: status ?? this.status,
      employeeNumber: employeeNumber ?? this.employeeNumber,
      branchNumber: branchNumber ?? this.branchNumber,
    );
  }

  @override
  List<Object> get props => [
        status,
        employeeNumber,
        employeeNumber  ,
      ];
}
