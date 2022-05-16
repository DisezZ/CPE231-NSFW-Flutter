
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../business_logic/blocs/update/employee_branch/bloc/update_employee_branch_bloc.dart';

class UpdateEmployeeBranchForm extends StatelessWidget {
  const UpdateEmployeeBranchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _EmployeeNumberInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _EmployeeBranchInput(),
        const Padding(padding: EdgeInsets.all(12)),
        _UpdateEmployeeBranchButton(),
      ],
    );
  }
}

class _EmployeeNumberInput extends StatelessWidget {
  const _EmployeeNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateEmployeeBranchBloc, UpdateEmployeeBranchState>(
      buildWhen: (previous, current) =>
          previous.employeeNumber != current.employeeNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('updateAtmBranchForm_employeeNumberInput_textField'),
          onChanged: (employeeNumber) => context
              .read<UpdateEmployeeBranchBloc>()
              .add(UpdateEmployeeBranchEmployeeNumberChanged(employeeNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'from atm number',
            errorText: state.employeeNumber.invalid ? 'invalid atm number' : null,
          ),
        );
      },
    );
  }
}

class _EmployeeBranchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateEmployeeBranchBloc, UpdateEmployeeBranchState>(
      buildWhen: (previous, current) => previous.branchNumber != current.branchNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('updateAtmBranchForm_branchNumberInput_textField'),
          onChanged: (branchNumber) => context
              .read<UpdateEmployeeBranchBloc>()
              .add(UpdateEmployeeBranchBranchNumberChanged(branchNumber)),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'branch number',
            errorText: state.branchNumber.invalid ? 'invalid branch number' : null,
          ),
        );
      },
    );
  }
}

class _UpdateEmployeeBranchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateEmployeeBranchBloc, UpdateEmployeeBranchState>(
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
                            .read<UpdateEmployeeBranchBloc>()
                            .add(const UpdateEmployeeBranchSubmitted());
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
