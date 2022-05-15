import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../../../business_logic/blocs/loaning/bloc/loaning_bloc.dart';

class LoaningForm extends StatelessWidget {
  const LoaningForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _ForAccountNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _LoaningAmountInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _LoaningButton(),
      ],
    );
  }
}

class _ForAccountNumberInput extends StatelessWidget {
  const _ForAccountNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaningBloc, LoaningState>(
      buildWhen: (previous, current) =>
          previous.forAccountNumber != current.forAccountNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('loaningForm_toAccountNumberInput_textField'),
          onChanged: (toAccountNumber) => context
              .read<LoaningBloc>()
              .add(LoaningForAccountNumberChanged(toAccountNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'for account number',
            errorText: state.forAccountNumber.invalid
                ? 'invalid account number'
                : null,
          ),
        );
      },
    );
  }
}

class _LoaningAmountInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaningBloc, LoaningState>(
      buildWhen: (previous, current) => previous.amount != current.amount,
      builder: (context, state) {
        return TextField(
          key: const Key('loaningForm_amountInput_textField'),
          onChanged: (amount) =>
              context.read<LoaningBloc>().add(LoaningAmountChanged(amount)),
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

class _LoaningButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaningBloc, LoaningState>(
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
                key: const Key('loaningForm_continue_raisedButton'),
                child: const Text('Loan now!'),
                onPressed: state.status.isValidated
                    ? () async {
                        context
                            .read<LoaningBloc>()
                            .add(const LoaningSubmitted());
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
