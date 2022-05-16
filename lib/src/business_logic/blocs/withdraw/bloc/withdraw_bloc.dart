import '../../../../data/repositories/atm_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../data/models/inputs.dart';

part 'withdraw_event.dart';
part 'withdraw_state.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  WithdrawBloc({
    required AtmRepository atmRepository,
  })  : _atmRepository = atmRepository,
        super(const WithdrawState()) {
    on<WithdrawFromAccountNumberChanged>(_onFromAccountNumberChanged);
    on<WithdrawAtmNumberChanged>(_onAtmNumberChanged);
    on<WithdrawAmountChanged>(_onAmountChanged);
    on<WithdrawSubmitted>(_onSubmitted);
  }

  final AtmRepository _atmRepository;

  void _onFromAccountNumberChanged(
    WithdrawFromAccountNumberChanged event,
    Emitter<WithdrawState> emit,
  ) {
    final fromAccountNumber = AccountNumberInput.dirty(event.fromAccountNumber);
    emit(state.copyWith(
      fromAccountNumber: fromAccountNumber,
      status:
          Formz.validate([fromAccountNumber, state.atmNumber, state.amount]),
    ));
  }

  void _onAtmNumberChanged(
    WithdrawAtmNumberChanged event,
    Emitter<WithdrawState> emit,
  ) {
    final atmNumber = MobileNumberInput.dirty(event.atmNumber);
    emit(state.copyWith(
      atmNumber: atmNumber,
      status:
          Formz.validate([atmNumber, state.fromAccountNumber, state.amount]),
    ));
  }

  void _onAmountChanged(
    WithdrawAmountChanged event,
    Emitter<WithdrawState> emit,
  ) {
    final amount = MoneyInput.dirty(event.amount);
    emit(state.copyWith(
      amount: amount,
      status:
          Formz.validate([amount, state.fromAccountNumber, state.atmNumber]),
    ));
  }

  void _onSubmitted(
    WithdrawSubmitted event,
    Emitter<WithdrawState> emit,
  ) async {
    try {
      if (state.status.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        final res = await _atmRepository.withdraw(
          fromAccountNumber: state.fromAccountNumber.value,
          atmNumber: state.atmNumber.value,
          amount: state.amount.value,
        );
        if (res.error) {
          print('cancled');
          emit(state.copyWith(status: FormzStatus.submissionCanceled));
        } else {
          print('success');
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        }
      }
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      rethrow;
    }
  }
}
