import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:http/http.dart' as http;

import '../../../../../../business_logic/blocs/deposit/bloc/deposit_bloc.dart';
import '../../../../../../business_logic/blocs/deposit/bloc/deposit_bloc.dart';

class DepositForm extends StatelessWidget {
  const DepositForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ToAccountNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _AtmNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _DepositAmountInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _DepositButton(),
      ],
    );
  }
}

class _ToAccountNumberInput extends StatelessWidget {
  const _ToAccountNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositBloc, DepositState>(
      buildWhen: (previous, current) =>
          previous.toAccountNumber != current.toAccountNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('depositForm_toAccountNumberInput_textField'),
          onChanged: (toAccountNumber) => context
              .read<DepositBloc>()
              .add(DepositToAccountNumberChanged(toAccountNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'from account number',
            errorText:
                state.toAccountNumber.invalid ? 'invalid account number' : null,
          ),
        );
      },
    );
  }
}

class _AtmNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositBloc, DepositState>(
      buildWhen: (previous, current) => previous.atmNumber != current.atmNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('depositForm_atmNumberInput_textField'),
          onChanged: (toAccountNumber) => context
              .read<DepositBloc>()
              .add(DepositAtmNumberChanged(toAccountNumber)),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'at atm number',
            errorText: state.atmNumber.invalid ? 'invalid atm number' : null,
          ),
        );
      },
    );
  }
}

class _DepositAmountInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositBloc, DepositState>(
      buildWhen: (previous, current) => previous.amount != current.amount,
      builder: (context, state) {
        return TextField(
          key: const Key('depositForm_amountInput_textField'),
          onChanged: (amount) =>
              context.read<DepositBloc>().add(DepositAmountChanged(amount)),
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

class _DepositButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositBloc, DepositState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const CircularProgressIndicator();
        } else {
          return Column(
            children: [
              state.status.isSubmissionSuccess ? Text('Success') : Container(),
              state.status.isSubmissionFailure ? Text('Failured') : Container(),
              state.status.isSubmissionCanceled
                  ? Text('Canceled')
                  : Container(),
              ElevatedButton(
                key: const Key('topupForm_continue_raisedButton'),
                child: const Text('Deposit now'),
                onPressed: state.status.isValidated
                    ? () async {
                        context
                            .read<DepositBloc>()
                            .add(const DepositSubmitted());
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
