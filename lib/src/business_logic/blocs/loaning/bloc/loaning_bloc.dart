import '../../../../data/repositories/atm_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../data/models/inputs.dart';
import '../../../../data/repositories/loan_repository.dart';

part 'loaning_event.dart';
part 'loaning_state.dart';

class LoaningBloc extends Bloc<LoaningEvent, LoaningState> {
  LoaningBloc({
    required LoanRepository loanRepository,
  })  : _loanRepository = loanRepository,
        super(const LoaningState()) {
    on<LoaningForAccountNumberChanged>(_onForAccountNumberChanged);
    on<LoaningAmountChanged>(_onAmountChanged);
    on<LoaningSubmitted>(_onSubmitted);
  }

  final LoanRepository _loanRepository;

  void _onForAccountNumberChanged(
    LoaningForAccountNumberChanged event,
    Emitter<LoaningState> emit,
  ) {
    final forAccountNumber = AccountNumberInput.dirty(event.forAccountNumber);
    emit(state.copyWith(
      forAccountNumber: forAccountNumber,
      status:
          Formz.validate([forAccountNumber, state.amount]),
    ));
  }

  void _onAmountChanged(
    LoaningAmountChanged event,
    Emitter<LoaningState> emit,
  ) {
    final amount = MoneyInput.dirty(event.amount);
    emit(state.copyWith(
      amount: amount,
      status:
          Formz.validate([amount, state.forAccountNumber]),
    ));
  }

  void _onSubmitted(
    LoaningSubmitted event,
    Emitter<LoaningState> emit,
  ) async {
    try {
      if (state.status.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        final res = await _loanRepository.loan(
          forAccountNumber: state.forAccountNumber.value,
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
