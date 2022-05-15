import 'package:cpe231_nsfw_flutter/src/data/repositories/atm_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../data/models/inputs.dart';

part 'deposit_event.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc({
    required AtmRepository atmRepository,
  })  : _atmRepository = atmRepository,
        super(const DepositState()) {
    on<DepositToAccountNumberChanged>(_onToAccountNumberChanged);
    on<DepositAtmNumberChanged>(_onAtmNumberChanged);
    on<DepositAmountChanged>(_onAmountChanged);
    on<DepositSubmitted>(_onSubmitted);
  }

  final AtmRepository _atmRepository;

  void _onToAccountNumberChanged(
    DepositToAccountNumberChanged event,
    Emitter<DepositState> emit,
  ) {
    final toAccountNumber = AccountNumberInput.dirty(event.toAccountNumber);
    emit(state.copyWith(
      toAccountNumber: toAccountNumber,
      status:
          Formz.validate([toAccountNumber, state.atmNumber, state.amount]),
    ));
  }

  void _onAtmNumberChanged(
    DepositAtmNumberChanged event,
    Emitter<DepositState> emit,
  ) {
    final atmNumber = MobileNumberInput.dirty(event.atmNumber);
    emit(state.copyWith(
      atmNumber: atmNumber,
      status:
          Formz.validate([atmNumber, state.toAccountNumber, state.amount]),
    ));
  }

  void _onAmountChanged(
    DepositAmountChanged event,
    Emitter<DepositState> emit,
  ) {
    final amount = MoneyInput.dirty(event.amount);
    emit(state.copyWith(
      amount: amount,
      status:
          Formz.validate([amount, state.toAccountNumber, state.atmNumber]),
    ));
  }

  void _onSubmitted(
    DepositSubmitted event,
    Emitter<DepositState> emit,
  ) async {
    try {
      if (state.status.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        final res = await _atmRepository.deposit(
          toAccountNumber: state.toAccountNumber.value,
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
