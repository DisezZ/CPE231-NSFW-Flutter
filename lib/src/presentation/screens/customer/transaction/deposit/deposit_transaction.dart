import '../../../../../business_logic/blocs/transfer/bloc/transfer_bloc.dart';
import '../../../../../data/repositories/transfer_repository.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../transfer/widgets/transfer_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/blocs/transfer/bloc/transfer_bloc.dart';
import '../../../../../business_logic/blocs/deposit/bloc/deposit_bloc.dart';
import '../../../../../data/repositories/atm_repository.dart';
import '../../../../../data/repositories/transfer_repository.dart';
import 'widgets/deposit_form.dart';

class DepositTransaction extends StatelessWidget {
  DepositTransaction({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => DepositTransaction());
  }

  final _atmRepository = AtmRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _atmRepository,
      child: BlocProvider(
        create: ((context) => DepositBloc(atmRepository: _atmRepository)),
        child: const Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBar(
                back: true,
                title: 'Deposit',
              ),
            ),
            body: DepositForm()),
      ),
    );
  }
}
