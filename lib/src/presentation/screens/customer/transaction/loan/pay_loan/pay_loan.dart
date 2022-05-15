
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../business_logic/blocs/loaning/bloc/loaning_bloc.dart';
import '../../../../../../business_logic/blocs/pay_loan/bloc/pay_loan_bloc.dart';
import '../../../../../../data/repositories/loan_repository.dart';
import 'widgets/loan_paying_form.dart';

class PayLoanTransaction extends StatelessWidget {
  PayLoanTransaction({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => PayLoanTransaction());
  }

  final _loanRepository = LoanRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _loanRepository,
      child: BlocProvider(
        create: ((context) => PayLoanBloc(loanRepository: _loanRepository)),
        child: Scaffold(
            appBar: AppBar(
              leading: ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: PayLoanForm()),
      ),
    );
  }
}
