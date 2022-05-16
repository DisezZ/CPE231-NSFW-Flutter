part of 'update_account_membership_bloc.dart';

abstract class UpdateAccountMembershipEvent extends Equatable {
  const UpdateAccountMembershipEvent();

  @override
  List<Object> get props => [];
}

class UpdateAccountMembershipAccountNumberChanged extends UpdateAccountMembershipEvent {
  const UpdateAccountMembershipAccountNumberChanged(this.accountNumber);

  final String accountNumber;

  @override
  List<Object> get props => [accountNumber];
}

class UpdateAccountMembershipMembershiphNumberChanged extends UpdateAccountMembershipEvent {
  const UpdateAccountMembershipMembershiphNumberChanged(this.membershipNumber);

  final String membershipNumber;

  @override
  List<Object> get props => [membershipNumber];
}

class UpdateAccountMembershipSubmitted extends UpdateAccountMembershipEvent {
  const UpdateAccountMembershipSubmitted();
}