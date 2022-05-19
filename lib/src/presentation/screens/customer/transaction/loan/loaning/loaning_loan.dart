import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../business_logic/blocs/loaning/bloc/loaning_bloc.dart';
import '../../../../../../data/repositories/loan_repository.dart';
import '../../../../../widgets/custom_app_bar.dart';
import 'widgets/loaning_form.dart';

class LoaningTransaction extends StatelessWidget {
  LoaningTransaction({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => LoaningTransaction());
  }

  final _loanRepository = LoanRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _loanRepository,
      child: BlocProvider(
        create: ((context) => LoaningBloc(loanRepository: _loanRepository)),
        child: const Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBar(
                back: true,
                title: 'Loaning',
              ),
            ),
            body: LoaningForm()),
      ),
    );
  }
}
