import '../../../../data/repositories/transfer_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../data/models/inputs.dart';
import '../../../../data/repositories/authentication_repository.dart';
import '../../../../data/repositories/user_repository.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc({
    required TransferRepository transferRepository,
  })  : _transferRepository = transferRepository,
        super(const TransferState()) {
    on<TransferFromAccountNumberChanged>(_onFromAccountNumberChanged);
    on<TransferToAccountNumberChanged>(_onToMobileNumberChanged);
    on<TransferAmountChanged>(_onAmountChanged);
    on<TransferSubmitted>(_onSubmitted);
  }

  final TransferRepository _transferRepository;

  void _onFromAccountNumberChanged(
    TransferFromAccountNumberChanged event,
    Emitter<TransferState> emit,
  ) {
    final fromAccountNumber = AccountNumberInput.dirty(event.fromAccountNumber);
    emit(state.copyWith(
      fromAccountNumber: fromAccountNumber,
      status: Formz.validate(
          [fromAccountNumber, state.toAccountNumber, state.amount]),
    ));
  }

  void _onToMobileNumberChanged(
    TransferToAccountNumberChanged event,
    Emitter<TransferState> emit,
  ) {
    final toAccountNumber = MobileNumberInput.dirty(event.toAccountNumber);
    emit(state.copyWith(
      toAccountNumber: toAccountNumber,
      status: Formz.validate(
          [toAccountNumber, state.fromAccountNumber, state.amount]),
    ));
  }

  void _onAmountChanged(
    TransferAmountChanged event,
    Emitter<TransferState> emit,
  ) {
    final amount = MoneyInput.dirty(event.amount);
    emit(state.copyWith(
      amount: amount,
      status: Formz.validate(
          [amount, state.fromAccountNumber, state.toAccountNumber]),
    ));
  }

  void _onSubmitted(
    TransferSubmitted event,
    Emitter<TransferState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final res = await _transferRepository.transfer(
        fromAccountNumber: state.fromAccountNumber.value,
        toAccountNumber: state.toAccountNumber.value,
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
  }
}
