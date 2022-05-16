import '../../../../../business_logic/blocs/update/atm_branch/bloc/update_atm_branch_bloc.dart';
import '../../../../../data/repositories/simple_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'update_atm_form.dart';

class UpdateAtmBranchScreen extends StatelessWidget {
  UpdateAtmBranchScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => UpdateAtmBranchScreen());
  }

  final _simpleReSimpleRepository = SimpleRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _simpleReSimpleRepository,
      child: BlocProvider(
        create: ((context) =>
            UpdateAtmBranchBloc(simpleRepository: _simpleReSimpleRepository)),
        child: Scaffold(
            appBar: AppBar(
              leading: ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: const UpdateAtmBranchForm()),
      ),
    );
  }
}
