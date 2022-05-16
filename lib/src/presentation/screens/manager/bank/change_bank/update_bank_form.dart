import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../business_logic/blocs/update/bank_name/bloc/update_bank_name_bloc.dart';

class UpdateBankNameForm extends StatelessWidget {
  const UpdateBankNameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _BankNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _BankNameInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _UpdateBankNameButton(),
      ],
    );
  }
}

class _BankNumberInput extends StatelessWidget {
  const _BankNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateBankNameBloc, UpdateBankNameState>(
      buildWhen: (previous, current) =>
          previous.bankNumber != current.bankNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('updateAtmBranchForm_bankNumberInput_textField'),
          onChanged: (bankNumber) => context
              .read<UpdateBankNameBloc>()
              .add(UpdateBankNameBankNumberChanged(bankNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'from atm number',
            errorText: state.bankNumber.invalid ? 'invalid atm number' : null,
          ),
        );
      },
    );
  }
}

class _BankNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateBankNameBloc, UpdateBankNameState>(
      buildWhen: (previous, current) => previous.newName != current.newName,
      builder: (context, state) {
        return TextField(
          key: const Key('updateAtmBranchForm_newNameInput_textField'),
          onChanged: (newName) => context
              .read<UpdateBankNameBloc>()
              .add(UpdateBankNameBankNameChanged(newName)),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'branch number',
            errorText: state.newName.invalid ? 'invalid branch number' : null,
          ),
        );
      },
    );
  }
}

class _UpdateBankNameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateBankNameBloc, UpdateBankNameState>(
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
                key: const Key('updateAtmBranchForm_continue_raisedButton'),
                child: const Text('Pay'),
                onPressed: state.status.isValidated
                    ? () async {
                        context
                            .read<UpdateBankNameBloc>()
                            .add(const UpdateBankNameSubmitted());
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
