import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:http/http.dart' as http;

import '../../../../../../business_logic/blocs/withdraw/bloc/withdraw_bloc.dart';

class WithdrawForm extends StatelessWidget {
  const WithdrawForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _FromAccountNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _AtmNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _WithdrawAmountInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _WithdrawButton(),
      ],
    );
  }
}

class _FromAccountNumberInput extends StatelessWidget {
  const _FromAccountNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WithdrawBloc, WithdrawState>(
      buildWhen: (previous, current) =>
          previous.fromAccountNumber != current.fromAccountNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('withdrawForm_fromAccountNumberInput_textField'),
          onChanged: (fromAccountNumber) => context
              .read<WithdrawBloc>()
              .add(WithdrawFromAccountNumberChanged(fromAccountNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'from account number',
            errorText: state.fromAccountNumber.invalid
                ? 'invalid account number'
                : null,
          ),
        );
      },
    );
  }
}

class _AtmNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WithdrawBloc, WithdrawState>(
      buildWhen: (previous, current) =>
          previous.atmNumber != current.atmNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('withdrawForm_atmNumberInput_textField'),
          onChanged: (toAccountNumber) => context
              .read<WithdrawBloc>()
              .add(WithdrawAtmNumberChanged(toAccountNumber)),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'atm number',
            errorText:
                state.atmNumber.invalid ? 'invalid atm number' : null,
          ),
        );
      },
    );
  }
}

class _WithdrawAmountInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WithdrawBloc, WithdrawState>(
      buildWhen: (previous, current) => previous.amount != current.amount,
      builder: (context, state) {
        return TextField(
          key: const Key('withdrawForm_amountInput_textField'),
          onChanged: (amount) =>
              context.read<WithdrawBloc>().add(WithdrawAmountChanged(amount)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'amount',
            errorText: state.amount.invalid ? 'invalid amount' : null,
          ),
        );
      },
    );
  }
}

class _WithdrawButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WithdrawBloc, WithdrawState>(
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
                key: const Key('topupForm_continue_raisedButton'),
                child: const Text('Withdraw'),
                onPressed: state.status.isValidated
                    ? () async {
                        context
                            .read<WithdrawBloc>()
                            .add(const WithdrawSubmitted());
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
