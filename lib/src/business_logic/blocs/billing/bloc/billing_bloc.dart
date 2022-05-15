import 'package:cpe231_nsfw_flutter/src/data/repositories/billing_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../data/models/inputs.dart';
import '../../../../data/repositories/authentication_repository.dart';
import '../../../../data/repositories/user_repository.dart';

part 'billing_event.dart';
part 'billing_state.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  BillingBloc({
    required BillingRepository billingRepository,
  })  : _billingRepository = billingRepository,
        super(const BillingState()) {
    on<BillingFromAccountNumberChanged>(_onFromAccountNumberChanged);
    on<BillingBillNumberChanged>(_onToMobileNumberChanged);
    on<BillingSubmitted>(_onSubmitted);
  }

  final BillingRepository _billingRepository;

  void _onFromAccountNumberChanged(
    BillingFromAccountNumberChanged event,
    Emitter<BillingState> emit,
  ) {
    final fromAccountNumber = AccountNumberInput.dirty(event.fromAccountNumber);
    emit(state.copyWith(
      fromAccountNumber: fromAccountNumber,
      status: Formz.validate([fromAccountNumber, state.billNumber]),
    ));
  }

  void _onToMobileNumberChanged(
    BillingBillNumberChanged event,
    Emitter<BillingState> emit,
  ) {
    final billNumber = MobileNumberInput.dirty(event.billNumber);
    emit(state.copyWith(
      billNumber: billNumber,
      status: Formz.validate([billNumber, state.fromAccountNumber]),
    ));
  }

  void _onSubmitted(
    BillingSubmitted event,
    Emitter<BillingState> emit,
  ) async {
    try {
      if (state.status.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        final res = await _billingRepository.payBill(
          fromAccountNumber: state.fromAccountNumber.value,
          billNumber: state.billNumber.value,
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
