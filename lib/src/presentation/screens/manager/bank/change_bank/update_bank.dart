import '../../../../../business_logic/blocs/update/bank_name/bloc/update_bank_name_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/simple_repository.dart';
import 'update_bank_form.dart';

class UpdateBankNameScreen extends StatelessWidget {
  UpdateBankNameScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => UpdateBankNameScreen());
  }

  final _simpleRepository = SimpleRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _simpleRepository,
      child: BlocProvider(
        create: ((context) =>
            UpdateBankNameBloc(simpleRepository: _simpleRepository)),
        child: Scaffold(
            appBar: AppBar(
              leading: ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: const UpdateBankNameForm()),
      ),
    );
  }
}
