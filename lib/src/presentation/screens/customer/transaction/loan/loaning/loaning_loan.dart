
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../business_logic/blocs/loaning/bloc/loaning_bloc.dart';
import '../../../../../../data/repositories/loan_repository.dart';
import 'widgets/loaning_form.dart';

class LoaningTransaction extends StatelessWidget {
  LoaningTransaction({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoaningTransaction());
  }

  final _loanRepository = LoanRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _loanRepository,
      child: BlocProvider(
        create: ((context) => LoaningBloc(loanRepository: _loanRepository)),
        child: Scaffold(
            appBar: AppBar(
              leading: ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: LoaningForm()),
      ),
    );
  }
}
