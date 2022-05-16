import '../../../../data/repositories/topup_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../data/models/inputs.dart';
import '../../../../data/repositories/authentication_repository.dart';
import '../../../../data/repositories/user_repository.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc({
    required TopupRepository topupRepository,
  })  : _topupRepository = topupRepository,
        super(const TopupState()) {
    on<TopupFromAccountNumberChanged>(_onFromAccountNumberChanged);
    on<TopupToMobileNumberChanged>(_onToMobileNumberChanged);
    on<TopupAmountChanged>(_onAmountChanged);
    on<TopupSubmitted>(_onSubmitted);
  }

  final TopupRepository _topupRepository;

  void _onFromAccountNumberChanged(
    TopupFromAccountNumberChanged event,
    Emitter<TopupState> emit,
  ) {
    final fromAccountNumber = AccountNumberInput.dirty(event.fromAccountNumber);
    emit(state.copyWith(
      fromAccountNumber: fromAccountNumber,
      status: Formz.validate(
          [fromAccountNumber, state.toMobileNumber, state.amount]),
    ));
  }

  void _onToMobileNumberChanged(
    TopupToMobileNumberChanged event,
    Emitter<TopupState> emit,
  ) {
    final toMobileNumber = MobileNumberInput.dirty(event.toMobileNumber);
    emit(state.copyWith(
      toMobileNumber: toMobileNumber,
      status: Formz.validate(
          [toMobileNumber, state.fromAccountNumber, state.amount]),
    ));
  }

  void _onAmountChanged(
    TopupAmountChanged event,
    Emitter<TopupState> emit,
  ) {
    final amount = MoneyInput.dirty(event.amount);
    emit(state.copyWith(
      amount: amount,
      status: Formz.validate(
          [amount, state.fromAccountNumber, state.toMobileNumber]),
    ));
  }

  void _onSubmitted(
    TopupSubmitted event,
    Emitter<TopupState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        final res = await _topupRepository.topup(
          fromAccountNumber: state.fromAccountNumber.value,
          toMobileNumber: state.toMobileNumber.value,
          amount: state.amount.value,
        );
        if (res.error) {
          emit(state.copyWith(status: FormzStatus.submissionCanceled));
        } else {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        }
        //final User user = await _userRepository.getUser() ?? User.empty;
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
