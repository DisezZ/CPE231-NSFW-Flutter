import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../business_logic/blocs/loaning/bloc/loaning_bloc.dart';
import '../../../../../../business_logic/blocs/pay_loan/bloc/pay_loan_bloc.dart';
import '../../../../../../data/repositories/loan_repository.dart';
import '../../../../../widgets/custom_app_bar.dart';
import 'widgets/loan_paying_form.dart';

class PayLoanTransaction extends StatelessWidget {
  PayLoanTransaction({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => PayLoanTransaction());
  }

  final _loanRepository = LoanRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _loanRepository,
      child: BlocProvider(
        create: ((context) => PayLoanBloc(loanRepository: _loanRepository)),
        child: const Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBar(
                back: true,
                title: 'Pay Loan',
              ),
            ),
            body: PayLoanForm()),
      ),
    );
  }
}
