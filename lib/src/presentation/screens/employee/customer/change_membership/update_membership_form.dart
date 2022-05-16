import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:http/http.dart' as http;

import '../../../../../business_logic/blocs/update/account_membership/bloc/update_account_membership_bloc.dart';

class UpdateAccountMembershipForm extends StatelessWidget {
  const UpdateAccountMembershipForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _AccountNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _MembershipNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _UpdateAccountMembershipButton(),
      ],
    );
  }
}

class _AccountNumberInput extends StatelessWidget {
  const _AccountNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateAccountMembershipBloc, UpdateAccountMembershipState>(
      buildWhen: (previous, current) =>
          previous.accountNumber != current.accountNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('updateAccountMembershipForm_accountNumberInput_textField'),
          onChanged: (accountNumber) => context
              .read<UpdateAccountMembershipBloc>()
              .add(UpdateAccountMembershipAccountNumberChanged(accountNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'from account number',
            errorText: state.accountNumber.invalid
                ? 'invalid account number'
                : null,
          ),
        );
      },
    );
  }
}

class _MembershipNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateAccountMembershipBloc, UpdateAccountMembershipState>(
      buildWhen: (previous, current) =>
          previous.membershipNumber != current.membershipNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('updateAccountMembershipForm_membershipNumberInput_textField'),
          onChanged: (membershipNumber) => context
              .read<UpdateAccountMembershipBloc>()
              .add(UpdateAccountMembershipMembershiphNumberChanged(membershipNumber)),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'membership number',
            errorText:
                state.membershipNumber.invalid ? 'invalid account number' : null,
          ),
        );
      },
    );
  }
}

class _UpdateAccountMembershipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateAccountMembershipBloc, UpdateAccountMembershipState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const CircularProgressIndicator();
        } else {
          return Column(
            children: [
              state.status.isSubmissionSuccess ? Text('Success') : Container(),
              state.status.isSubmissionFailure ? Text('Failured') : Container(),
              state.status.isSubmissionCanceled ? Text('Canceled') : Container(),
              ElevatedButton(
                key: const Key('updateAccountMembershipForm_continue_raisedButton'),
                child: const Text('Pay'),
                onPressed: state.status.isValidated
                    ? () async {
                        context
                            .read<UpdateAccountMembershipBloc>()
                            .add(const UpdateAccountMembershipSubmitted());
                      }
                    : null,
              ),
            ],
          );
        }
      },
    );
  }
}
