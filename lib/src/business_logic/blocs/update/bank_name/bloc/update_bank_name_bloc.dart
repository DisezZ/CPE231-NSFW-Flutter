import '../../../../../data/repositories/simple_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../data/models/inputs.dart';

part 'update_bank_name_event.dart';
part 'update_bank_name_state.dart';

class UpdateBankNameBloc
    extends Bloc<UpdateBankNameEvent, UpdateBankNameState> {
  UpdateBankNameBloc({
    required SimpleRepository simpleRepository,
  })  : _simpleRepository = simpleRepository,
        super(const UpdateBankNameState()) {
    on<UpdateBankNameBankNumberChanged>(_onBankNumberChanged);
    on<UpdateBankNameBankNameChanged>(_onBankNameChanged);
    on<UpdateBankNameSubmitted>(_onSubmitted);
  }

  String _newName = '';
  final SimpleRepository _simpleRepository;

  void _onBankNumberChanged(
    UpdateBankNameBankNumberChanged event,
    Emitter<UpdateBankNameState> emit,
  ) {
    final bankNumber = AccountNumberInput.dirty(event.bankNumber);
    emit(state.copyWith(
      bankNumber: bankNumber,
      status: Formz.validate([bankNumber, state.newName]),
    ));
  }

  void _onBankNameChanged(
    UpdateBankNameBankNameChanged event,
    Emitter<UpdateBankNameState> emit,
  ) {
    final newName = MobileNumberInput.dirty(event.newName);
    _newName = newName.value;
    emit(state.copyWith(
      newName: newName,
      status: Formz.validate([newName, state.bankNumber]),
    ));
  }

  void _onSubmitted(
    UpdateBankNameSubmitted event,
    Emitter<UpdateBankNameState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final res = await _simpleRepository.updateBankName(
          bankId: state.bankNumber.value, newName: _newName);
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
