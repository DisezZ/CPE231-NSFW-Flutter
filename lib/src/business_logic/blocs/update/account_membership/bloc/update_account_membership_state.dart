part of 'update_account_membership_bloc.dart';

class UpdateAccountMembershipState extends Equatable {
  const UpdateAccountMembershipState({
    this.status = FormzStatus.pure,
    this.accountNumber = const AccountNumberInput.pure(),
    this.membershipNumber= const AccountNumberInput.pure(),
  });

  final FormzStatus status;
  final AccountNumberInput accountNumber;
  final AccountNumberInput membershipNumber;


  UpdateAccountMembershipState copyWith({
    FormzStatus? status,
    AccountNumberInput? accountNumber,
    AccountNumberInput? membershipNumber,
  }) {
    return UpdateAccountMembershipState(
      status: status ?? this.status,
      accountNumber: accountNumber ?? this.accountNumber,
      membershipNumber: membershipNumber ?? this.membershipNumber,
    );
  }

  @override
  List<Object> get props => [
        status,
        accountNumber,
        accountNumber  ,
      ];
}
