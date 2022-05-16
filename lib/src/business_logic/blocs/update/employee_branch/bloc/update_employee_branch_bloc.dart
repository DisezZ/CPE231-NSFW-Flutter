import '../../../../../data/repositories/simple_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../data/models/inputs.dart';

part 'update_employee_branch_event.dart';
part 'update_employee_branch_state.dart';

class UpdateEmployeeBranchBloc
    extends Bloc<UpdateEmployeeBranchEvent, UpdateEmployeeBranchState> {
  UpdateEmployeeBranchBloc({
    required SimpleRepository simpleRepository,
  })  : _simpleRepository = simpleRepository,
        super(const UpdateEmployeeBranchState()) {
    on<UpdateEmployeeBranchEmployeeNumberChanged>(_onEmployeeNumberChanged);
    on<UpdateEmployeeBranchBranchNumberChanged>(_onBranchNumberChanged);
    on<UpdateEmployeeBranchSubmitted>(_onSubmitted);
  }

  final SimpleRepository _simpleRepository;

  void _onEmployeeNumberChanged(
    UpdateEmployeeBranchEmployeeNumberChanged event,
    Emitter<UpdateEmployeeBranchState> emit,
  ) {
    final employeeNumber = AccountNumberInput.dirty(event.employeeNumber);
    emit(state.copyWith(
      employeeNumber: employeeNumber,
      status: Formz.validate([employeeNumber, state.branchNumber]),
    ));
  }

  void _onBranchNumberChanged(
    UpdateEmployeeBranchBranchNumberChanged event,
    Emitter<UpdateEmployeeBranchState> emit,
  ) {
    final branchNumber = AccountNumberInput.dirty(event.branchNumber);
    emit(state.copyWith(
      branchNumber: branchNumber,
      status: Formz.validate([branchNumber, state.employeeNumber]),
    ));
  }

  void _onSubmitted(
    UpdateEmployeeBranchSubmitted event,
    Emitter<UpdateEmployeeBranchState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final res = await _simpleRepository.updateEmployeeBranch(
          employeeId: state.employeeNumber.value, toBranchId: state.branchNumber.value);
      if (res.error) {
        print('cancled');
        emit(state.copyWith(status: FormzStatus.submissionCanceled));
      } else {
        print('success');
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
    }
  }
}
