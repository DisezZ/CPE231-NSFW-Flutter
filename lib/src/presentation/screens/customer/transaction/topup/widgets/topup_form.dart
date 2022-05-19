import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../../business_logic/blocs/topup/bloc/topup_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../../../constants/api.dart';

class TopupForm extends StatelessWidget {
  const TopupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _FromAccountNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _ToMobileNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _TopupAmountInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _TopupButton(),
      ],
    );
  }
}

class _FromAccountNumberInput extends StatelessWidget {
  const _FromAccountNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopupBloc, TopupState>(
      buildWhen: (previous, current) =>
          previous.fromAccountNumber != current.fromAccountNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('topupForm_fromAccountNumberInput_textField'),
          onChanged: (fromAccountNumber) => context
              .read<TopupBloc>()
              .add(TopupFromAccountNumberChanged(fromAccountNumber)),
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
    return BlocBuilder<TopupBloc, TopupState>(
      buildWhen: (previous, current) =>
          previous.toMobileNumber != current.toMobileNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('topupForm_toMobileNumberInput_textField'),
          onChanged: (toMobileNumber) => context
              .read<TopupBloc>()
              .add(TopupToMobileNumberChanged(toMobileNumber)),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'to mobile number',
            errorText:
                state.toMobileNumber.invalid ? 'invalid mobile number' : null,
          ),
        );
      },
    );
  }
}

class _TopupAmountInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopupBloc, TopupState>(
      buildWhen: (previous, current) => previous.amount != current.amount,
      builder: (context, state) {
        return TextField(
          key: const Key('topupForm_toMobileNumberInput_textField'),
          onChanged: (amount) =>
              context.read<TopupBloc>().add(TopupAmountChanged(amount)),
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

class _TopupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopupBloc, TopupState>(
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
                child: const Text('Topup now'),
                onPressed: state.status.isValidated
                    ? () async {
                        context.read<TopupBloc>().add(const TopupSubmitted());
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
