

import '../../../../../business_logic/blocs/update/atm_branch/bloc/update_atm_branch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';



class UpdateAtmBranchForm extends StatelessWidget {
  const UpdateAtmBranchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _AtmNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _BranchNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _UpdateAtmBranchButton(),
      ],
    );
  }
}

class _AtmNumberInput extends StatelessWidget {
  const _AtmNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateAtmBranchBloc, UpdateAtmBranchState>(
      buildWhen: (previous, current) =>
          previous.atmNumber != current.atmNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('updateAtmBranchForm_atmNumberInput_textField'),
          onChanged: (atmNumber) => context
              .read<UpdateAtmBranchBloc>()
              .add(UpdateAtmBranchAtmNumberChanged(atmNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'from atm number',
            errorText: state.atmNumber.invalid
                ? 'invalid atm number'
                : null,
          ),
        );
      },
    );
  }
}

class _BranchNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateAtmBranchBloc, UpdateAtmBranchState>(
      buildWhen: (previous, current) =>
          previous.branchNumber != current.branchNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('updateAtmBranchForm_branchNumberInput_textField'),
          onChanged: (branchNumber) => context
              .read<UpdateAtmBranchBloc>()
              .add(UpdateAtmBranchBranchNumberChanged(branchNumber)),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'branch number',
            errorText:
                state.branchNumber.invalid ? 'invalid branch number' : null,
          ),
        );
      },
    );
  }
}

class _UpdateAtmBranchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateAtmBranchBloc, UpdateAtmBranchState>(
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
                key: const Key('updateAtmBranchForm_continue_raisedButton'),
                child: const Text('Pay'),
                onPressed: state.status.isValidated
                    ? () async {
                        context
                            .read<UpdateAtmBranchBloc>()
                            .add(const UpdateAtmBranchSubmitted());
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
