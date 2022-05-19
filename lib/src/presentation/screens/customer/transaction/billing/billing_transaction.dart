import '../../../../../business_logic/blocs/billing/bloc/billing_bloc.dart';
import '../../../../../data/repositories/billing_repository.dart';
import '../../../../widgets/custom_app_bar.dart';
import 'widgets/billing_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/blocs/billing/bloc/billing_bloc.dart';
import '../../../../../data/repositories/billing_repository.dart';

class BillingTransaction extends StatelessWidget {
  BillingTransaction({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => BillingTransaction());
  }

  final _billingRepository = BillingRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _billingRepository,
      child: BlocProvider(
        create: ((context) =>
            BillingBloc(billingRepository: _billingRepository)),
        child: const Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBar(
                back: true,
                title: 'Billing',
              ),
            ),
            body: BillingForm()),
      ),
    );
  }
}
