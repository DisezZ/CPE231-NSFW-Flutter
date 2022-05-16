import 'package:cpe231_nsfw_flutter/src/business_logic/blocs/update/employee_branch/bloc/update_employee_branch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/blocs/update/atm_branch/bloc/update_atm_branch_bloc.dart';
import '../../../../../data/repositories/simple_repository.dart';
import 'update_employee_form.dart';

class UpdateEmployeeBranchScreen extends StatelessWidget {
  UpdateEmployeeBranchScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => UpdateEmployeeBranchScreen());
  }

  final simpleRepository = SimpleRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: simpleRepository,
      child: BlocProvider(
        create: ((context) =>
            UpdateEmployeeBranchBloc(simpleRepository: simpleRepository)),
        child: Scaffold(
            appBar: AppBar(
              leading: ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: const UpdateEmployeeBranchForm()),
      ),
    );
  }
}
