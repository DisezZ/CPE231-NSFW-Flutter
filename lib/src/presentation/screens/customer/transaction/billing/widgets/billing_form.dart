import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:http/http.dart' as http;

import '../../../../../../business_logic/blocs/billing/bloc/billing_bloc.dart';
import '../../../../../../business_logic/blocs/billing/bloc/billing_bloc.dart';
import '../../../../../../constants/api.dart';

class BillingForm extends StatelessWidget {
  const BillingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _FromAccountNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _ToBillNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _BillingButton(),
      ],
    );
  }
}

class _FromAccountNumberInput extends StatelessWidget {
  const _FromAccountNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      buildWhen: (previous, current) =>
          previous.fromAccountNumber != current.fromAccountNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('billingForm_fromAccountNumberInput_textField'),
          onChanged: (fromAccountNumber) => context
              .read<BillingBloc>()
              .add(BillingFromAccountNumberChanged(fromAccountNumber)),
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

class _ToBillNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      buildWhen: (previous, current) =>
          previous.billNumber != current.billNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('billingForm_billNumberInput_textField'),
          onChanged: (billNumber) => context
              .read<BillingBloc>()
              .add(BillingBillNumberChanged(billNumber)),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'bill number',
            errorText:
                state.billNumber.invalid ? 'invalid account number' : null,
          ),
        );
      },
    );
  }
}

class _BillingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
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
                child: const Text('Pay'),
                onPressed: state.status.isValidated
                    ? () async {
                        context
                            .read<BillingBloc>()
                            .add(const BillingSubmitted());
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
