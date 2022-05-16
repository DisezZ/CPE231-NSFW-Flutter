part of 'update_atm_branch_bloc.dart';

abstract class UpdateAtmBranchEvent extends Equatable {
  const UpdateAtmBranchEvent();

  @override
  List<Object> get props => [];
}

class UpdateAtmBranchAtmNumberChanged extends UpdateAtmBranchEvent {
  const UpdateAtmBranchAtmNumberChanged(this.atmNumber);

  final String atmNumber;

  @override
  List<Object> get props => [atmNumber];
}

class UpdateAtmBranchBranchNumberChanged extends UpdateAtmBranchEvent {
  const UpdateAtmBranchBranchNumberChanged(this.branchNumber);

  final String branchNumber;

  @override
  List<Object> get props => [branchNumber];
}

class UpdateAtmBranchSubmitted extends UpdateAtmBranchEvent {
  const UpdateAtmBranchSubmitted();
}