part of 'update_employee_branch_bloc.dart';

abstract class UpdateEmployeeBranchEvent extends Equatable {
  const UpdateEmployeeBranchEvent();

  @override
  List<Object> get props => [];
}

class UpdateEmployeeBranchEmployeeNumberChanged extends UpdateEmployeeBranchEvent {
  const UpdateEmployeeBranchEmployeeNumberChanged(this.employeeNumber);

  final String employeeNumber;

  @override
  List<Object> get props => [employeeNumber];
}

class UpdateEmployeeBranchBranchNumberChanged extends UpdateEmployeeBranchEvent {
  const UpdateEmployeeBranchBranchNumberChanged(this.branchNumber);

  final String branchNumber;

  @override
  List<Object> get props => [branchNumber];
}

class UpdateEmployeeBranchSubmitted extends UpdateEmployeeBranchEvent {
  const UpdateEmployeeBranchSubmitted();
}