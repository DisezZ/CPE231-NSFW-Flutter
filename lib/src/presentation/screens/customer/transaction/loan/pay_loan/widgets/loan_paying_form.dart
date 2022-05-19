import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../../../business_logic/blocs/pay_loan/bloc/pay_loan_bloc.dart';

class PayLoanForm extends StatelessWidget {
  const PayLoanForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ForAccountNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _LoanNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _PayLoanAmountInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _PayLoanButton(),
      ],
    );
  }
}

class _ForAccountNumberInput extends StatelessWidget {
  const _ForAccountNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayLoanBloc, PayLoanState>(
      buildWhen: (previous, current) =>
          previous.fromAccountNumber != current.fromAccountNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('payLoanForm_fromAccountNumberInput_textField'),
          onChanged: (forAccountNumber) => context
              .read<PayLoanBloc>()
              .add(PayLoanFromAccountNumberChanged(forAccountNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'for account number',
            errorText: state.fromAccountNumber.invalid
                ? 'invalid account number'
                : null,
          ),
        );
      },
    );
  }
}

class _LoanNumberInput extends StatelessWidget {
  const _LoanNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayLoanBloc, PayLoanState>(
      buildWhen: (previous, current) =>
          previous.loanNumber != current.loanNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('payLoanForm_loanNumberInput_textField'),
          onChanged: (loanNumber) => context
              .read<PayLoanBloc>()
              .add(PayLoanLoanNumberChanged(loanNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'loan number',
            errorText:
                state.fromAccountNumber.invalid ? 'invalid loan number' : null,
          ),
        );
      },
    );
  }
}

class _PayLoanAmountInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayLoanBloc, PayLoanState>(
      buildWhen: (previous, current) => previous.amount != current.amount,
      builder: (context, state) {
        return TextField(
          key: const Key('payLoanForm_amountInput_textField'),
          onChanged: (amount) =>
              context.read<PayLoanBloc>().add(PayLoanAmountChanged(amount)),
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

class _PayLoanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayLoanBloc, PayLoanState>(
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
                key: const Key('payLoanForm_continue_raisedButton'),
                child: const Text('Pay now'),
                onPressed: state.status.isValidated
                    ? () async {
                        context
                            .read<PayLoanBloc>()
                            .add(const PayLoanSubmitted());
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
