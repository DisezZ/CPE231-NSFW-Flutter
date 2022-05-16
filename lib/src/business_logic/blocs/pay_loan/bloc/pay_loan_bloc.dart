import '../../../../data/repositories/atm_repository.dart';
import '../../../../data/repositories/loan_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../data/models/inputs.dart';

part 'pay_loan_event.dart';
part 'pay_loan_state.dart';

class PayLoanBloc extends Bloc<PayLoanEvent, PayLoanState> {
  PayLoanBloc({
    required LoanRepository loanRepository,
  })  : _loanRepository = loanRepository,
        super(const PayLoanState()) {
    on<PayLoanFromAccountNumberChanged>(_onFromAccountNumberChanged);
    on<PayLoanLoanNumberChanged>(_onLoanNumberChanged);
    on<PayLoanAmountChanged>(_onAmountChanged);
    on<PayLoanSubmitted>(_onSubmitted);
  }

  final LoanRepository _loanRepository;

  void _onFromAccountNumberChanged(
    PayLoanFromAccountNumberChanged event,
    Emitter<PayLoanState> emit,
  ) {
    final fromAccountNumber = AccountNumberInput.dirty(event.fromAccountNumber);
    emit(state.copyWith(
      fromAccountNumber: fromAccountNumber,
      status:
          Formz.validate([fromAccountNumber, state.loanNumber, state.amount]),
    ));
  }

  void _onLoanNumberChanged(
    PayLoanLoanNumberChanged event,
    Emitter<PayLoanState> emit,
  ) {
    final loanNumber = AccountNumberInput.dirty(event.loanNumber);
    emit(state.copyWith(
      loanNumber: loanNumber,
      status:
          Formz.validate([loanNumber, state.fromAccountNumber, state.amount]),
    ));
  }

  void _onAmountChanged(
    PayLoanAmountChanged event,
    Emitter<PayLoanState> emit,
  ) {
    final amount = MoneyInput.dirty(event.amount);
    emit(state.copyWith(
      amount: amount,
      status:
          Formz.validate([amount, state.fromAccountNumber, state.loanNumber]),
    ));
  }

  void _onSubmitted(
    PayLoanSubmitted event,
    Emitter<PayLoanState> emit,
  ) async {
    try {
      if (state.status.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        final res = await _loanRepository.pay(
          forAccountNumber: state.fromAccountNumber.value,
          loanNumber: state.loanNumber.value,
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
