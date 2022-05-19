import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:http/http.dart' as http;

import '../../../../../../business_logic/blocs/transfer/bloc/transfer_bloc.dart';
import '../../../../../../constants/api.dart';

class TransferForm extends StatelessWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _FromAccountNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _ToMobileNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _TransferAmountInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _TransferButton(),
      ],
    );
  }
}

class _FromAccountNumberInput extends StatelessWidget {
  const _FromAccountNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferBloc, TransferState>(
      buildWhen: (previous, current) =>
          previous.fromAccountNumber != current.fromAccountNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('transferForm_fromAccountNumberInput_textField'),
          onChanged: (fromAccountNumber) => context
              .read<TransferBloc>()
              .add(TransferFromAccountNumberChanged(fromAccountNumber)),
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

class _ToMobileNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferBloc, TransferState>(
      buildWhen: (previous, current) =>
          previous.toAccountNumber != current.toAccountNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('transferForm_toAccountNumberInput_textField'),
          onChanged: (toAccountNumber) => context
              .read<TransferBloc>()
              .add(TransferToAccountNumberChanged(toAccountNumber)),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'to account number',
            errorText:
                state.toAccountNumber.invalid ? 'invalid account number' : null,
          ),
        );
      },
    );
  }
}

class _TransferAmountInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferBloc, TransferState>(
      buildWhen: (previous, current) => previous.amount != current.amount,
      builder: (context, state) {
        return TextField(
          key: const Key('transferForm_amountInput_textField'),
          onChanged: (amount) =>
              context.read<TransferBloc>().add(TransferAmountChanged(amount)),
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

class _TransferButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferBloc, TransferState>(
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
                child: const Text('Transfer now'),
                onPressed: state.status.isValidated
                    ? () async {
                        context
                            .read<TransferBloc>()
                            .add(const TransferSubmitted());
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
