import '../../../../../data/repositories/simple_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../data/models/inputs.dart';

part 'update_atm_branch_event.dart';
part 'update_atm_branch_state.dart';

class UpdateAtmBranchBloc
    extends Bloc<UpdateAtmBranchEvent, UpdateAtmBranchState> {
  UpdateAtmBranchBloc({
    required SimpleRepository simpleRepository,
  })  : _simpleRepository = simpleRepository,
        super(const UpdateAtmBranchState()) {
    on<UpdateAtmBranchAtmNumberChanged>(_onAtmNumberChanged);
    on<UpdateAtmBranchBranchNumberChanged>(_onBranchNumberChanged);
    on<UpdateAtmBranchSubmitted>(_onSubmitted);
  }

  final SimpleRepository _simpleRepository;

  void _onAtmNumberChanged(
    UpdateAtmBranchAtmNumberChanged event,
    Emitter<UpdateAtmBranchState> emit,
  ) {
    final atmNumber = AccountNumberInput.dirty(event.atmNumber);
    emit(state.copyWith(
      atmNumber: atmNumber,
      status: Formz.validate([atmNumber, state.branchNumber]),
    ));
  }

  void _onBranchNumberChanged(
    UpdateAtmBranchBranchNumberChanged event,
    Emitter<UpdateAtmBranchState> emit,
  ) {
    final branchNumber = MobileNumberInput.dirty(event.branchNumber);
    emit(state.copyWith(
      branchNumber: branchNumber,
      status: Formz.validate([branchNumber, state.atmNumber]),
      
    ));
  }

  void _onSubmitted(
    UpdateAtmBranchSubmitted event,
    Emitter<UpdateAtmBranchState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final res = await _simpleRepository.updateAtmBranch(
          atmId: state.atmNumber.value, toBranchId: state.branchNumber.value);
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
