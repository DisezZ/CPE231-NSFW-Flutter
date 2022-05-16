import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../data/models/inputs.dart';
import '../../../../../data/repositories/simple_repository.dart';

part 'update_account_membership_event.dart';
part 'update_account_membership_state.dart';

class UpdateAccountMembershipBloc
    extends Bloc<UpdateAccountMembershipEvent, UpdateAccountMembershipState> {
  UpdateAccountMembershipBloc({
    required SimpleRepository simpleRepository,
  })  : _simpleRepository = simpleRepository,
        super(const UpdateAccountMembershipState()) {
    on<UpdateAccountMembershipAccountNumberChanged>(_onAccountNumberChanged);
    on<UpdateAccountMembershipMembershiphNumberChanged>(_onMembershipNumberChanged);
    on<UpdateAccountMembershipSubmitted>(_onSubmitted);
  }

  final SimpleRepository _simpleRepository;

  void _onAccountNumberChanged(
    UpdateAccountMembershipAccountNumberChanged event,
    Emitter<UpdateAccountMembershipState> emit,
  ) {
    final accountNumber = AccountNumberInput.dirty(event.accountNumber);
    emit(state.copyWith(
      accountNumber: accountNumber,
      status: Formz.validate([accountNumber, state.membershipNumber]),
    ));
  }

  void _onMembershipNumberChanged(
    UpdateAccountMembershipMembershiphNumberChanged event,
    Emitter<UpdateAccountMembershipState> emit,
  ) {
    final membershipNumber = AccountNumberInput.dirty(event.membershipNumber);
    emit(state.copyWith(
      membershipNumber: membershipNumber,
      status: Formz.validate([membershipNumber, state.accountNumber]),
    ));
  }

  void _onSubmitted(
    UpdateAccountMembershipSubmitted event,
    Emitter<UpdateAccountMembershipState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final res = await _simpleRepository.updateAccountMember(
          accountId: state.accountNumber.value, membershipId: state.membershipNumber.value);
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
